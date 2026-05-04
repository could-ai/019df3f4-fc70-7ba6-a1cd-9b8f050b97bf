import 'package:flutter/material.dart';

void main() {
  runApp(const PresentationApp());
}

class PresentationApp extends StatelessWidget {
  const PresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presentasi Produk',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D47A1), // Corporate Blue
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto', // Default clean font
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DeckScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class DeckScreen extends StatefulWidget {
  const DeckScreen({super.key});

  @override
  State<DeckScreen> createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _slides = [
    const TitleSlide(),
    const IntroductionSlide(),
    const ProblemSolutionSlide(),
    const CalculationSlide(),
    const ConclusionSlide(),
  ];

  void _nextPage() {
    if (_currentPage < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Slides
          PageView.builder(
            controller: _pageController,
            itemCount: _slides.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(48.0),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: _slides[index],
                  ),
                ),
              );
            },
          ),
          
          // Navigation Overlays
          if (_currentPage > 0)
            Positioned(
              left: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, size: 40, color: Colors.black26),
                  onPressed: _previousPage,
                  hoverColor: Colors.black12,
                ),
              ),
            ),
            
          if (_currentPage < _slides.length - 1)
            Positioned(
              right: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 40, color: Colors.black26),
                  onPressed: _nextPage,
                  hoverColor: Colors.black12,
                ),
              ),
            ),
            
          // Progress/Page Indicator
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _slides.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  height: 8.0,
                  width: _currentPage == index ? 24.0 : 8.0,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// --- Slide 1: Judul Utama ---
class TitleSlide extends StatelessWidget {
  const TitleSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.auto_awesome,
          size: 100,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 32),
        Text(
          'Revolusi Bisnis Anda',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Platform otomasi cerdas untuk efisiensi maksimal',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 64),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            'Presentasi Pitching 2026',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}

// --- Slide 2: Pengertian Awalan ---
class IntroductionSlide extends StatelessWidget {
  const IntroductionSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Apa itu Produk Kami?',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Produk kami adalah ekosistem digital terpadu yang dirancang khusus untuk memotong waktu operasional dan mengurangi biaya overhead.',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(height: 1.5),
              ),
              const SizedBox(height: 32),
              _buildFeatureRow(context, Icons.speed, 'Cepat & Responsif', 'Sistem bekerja real-time tanpa delay.'),
              const SizedBox(height: 16),
              _buildFeatureRow(context, Icons.security, 'Aman & Terenkripsi', 'Data tersimpan dengan standar keamanan industri.'),
              const SizedBox(height: 16),
              _buildFeatureRow(context, Icons.integration_instructions, 'Mudah Diintegrasikan', 'Kompatibel dengan API dan legacy sistem Anda.'),
            ],
          ),
        ),
        const SizedBox(width: 64),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ]
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.dashboard_customize, size: 120, color: Theme.of(context).colorScheme.onSecondaryContainer),
                    const SizedBox(height: 24),
                    Text(
                      'Arsitektur Modern',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureRow(BuildContext context, IconData icon, String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(desc, style: const TextStyle(fontSize: 16, color: Colors.black54)),
            ],
          ),
        )
      ],
    );
  }
}

// --- Slide 3: Masalah dan Solusi ---
class ProblemSolutionSlide extends StatelessWidget {
  const ProblemSolutionSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Masalah vs Solusi',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 64),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCard(
              context, 
              title: 'Proses Manual', 
              desc: 'Pekerjaan berulang yang memakan waktu karyawan dan rentan human-error.',
              icon: Icons.warning_amber_rounded,
              color: Colors.red.shade100,
              iconColor: Colors.red.shade700,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Icon(Icons.arrow_forward, size: 48, color: Colors.grey.shade400),
            ),
            _buildCard(
              context, 
              title: 'Otomasi Penuh', 
              desc: 'Sistem mengambil alih tugas repetitif dengan akurasi 99.9%.',
              icon: Icons.check_circle_outline,
              color: Colors.green.shade100,
              iconColor: Colors.green.shade700,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildCard(BuildContext context, {required String title, required String desc, required IconData icon, required Color color, required Color iconColor}) {
    return Container(
      width: 350,
      height: 350,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: iconColor),
          const SizedBox(height: 24),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            desc,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// --- Slide 4: Perhitungan Interaktif ---
class CalculationSlide extends StatefulWidget {
  const CalculationSlide({super.key});

  @override
  State<CalculationSlide> createState() => _CalculationSlideState();
}

class _CalculationSlideState extends State<CalculationSlide> {
  double _employees = 10;
  double _hoursSavedPerDay = 2;
  double _hourlyRate = 150000; // Rp 150.000 per jam

  @override
  Widget build(BuildContext context) {
    
    double dailySavings = _employees * _hoursSavedPerDay * _hourlyRate;
    double monthlySavings = dailySavings * 22; // 22 hari kerja
    double yearlySavings = monthlySavings * 12;

    return Row(
      children: [
        // Kiri: Kalkulator
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kalkulator ROI',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('Sesuaikan slider untuk melihat potensi penghematan bisnis Anda.', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 48),
                
                _buildSlider(
                  label: 'Jumlah Karyawan (${_employees.toInt()} orang)',
                  value: _employees,
                  min: 1,
                  max: 100,
                  onChanged: (val) => setState(() => _employees = val),
                ),
                const SizedBox(height: 24),
                _buildSlider(
                  label: 'Waktu Dihemat per Hari (${_hoursSavedPerDay.toStringAsFixed(1)} jam)',
                  value: _hoursSavedPerDay,
                  min: 0.5,
                  max: 8,
                  divisions: 15,
                  onChanged: (val) => setState(() => _hoursSavedPerDay = val),
                ),
                const SizedBox(height: 24),
                _buildSlider(
                  label: 'Rate Gaji per Jam (Rp ${(_hourlyRate / 1000).toStringAsFixed(0)} Ribu)',
                  value: _hourlyRate,
                  min: 50000,
                  max: 500000,
                  divisions: 45,
                  onChanged: (val) => setState(() => _hourlyRate = val),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 64),
        // Kanan: Hasil
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Proyeksi Penghematan',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),
              _buildResultRow('Penghematan Per Hari', 'Rp ${_formatCurrency(dailySavings)}'),
              const Divider(height: 48),
              _buildResultRow('Penghematan Per Bulan', 'Rp ${_formatCurrency(monthlySavings)}'),
              const Divider(height: 48),
              _buildResultRow(
                'Total per Tahun', 
                'Rp ${_formatCurrency(yearlySavings)}',
                isHighlight: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSlider({required String label, required double value, required double min, required double max, int? divisions, required ValueChanged<double> onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          label: value.toStringAsFixed(1),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildResultRow(String label, String value, {bool isHighlight = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 18, color: Colors.black54)),
        const SizedBox(height: 8),
        Text(
          value, 
          style: TextStyle(
            fontSize: isHighlight ? 48 : 32, 
            fontWeight: FontWeight.bold,
            color: isHighlight ? Colors.green.shade700 : Colors.black87,
          ),
        ),
      ],
    );
  }

  String _formatCurrency(double amount) {
    if (amount >= 1000000000) {
      return '${(amount / 1000000000).toStringAsFixed(2)} Miliar';
    } else if (amount >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(1)} Juta';
    }
    return amount.toStringAsFixed(0);
  }
}

// --- Slide 5: Kesimpulan / CTA ---
class ConclusionSlide extends StatelessWidget {
  const ConclusionSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.rocket_launch, size: 100, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 32),
        Text(
          'Siap Memulai Transformasi?',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Hubungi tim sales kami untuk demo eksklusif hari ini.',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 64),
        ElevatedButton(
          onPressed: () {
            // Action
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text('Mulai Uji Coba Gratis', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
