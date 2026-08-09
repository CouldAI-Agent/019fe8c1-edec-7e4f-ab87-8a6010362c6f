import 'package:flutter/material.dart';

void main() {
  runApp(const EnglishPracticeApp());
}

class EnglishPracticeApp extends StatelessWidget {
  const EnglishPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Practice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/vocab': (context) => const VocabularyScreen(),
        '/quiz': (context) => const QuizScreen(),
      },
    );
  }
}

// --- Home Screen ---

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('English Practice'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.language,
                    size: 80,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Welcome to your daily practice!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 48),
                  _buildMenuCard(
                    context,
                    title: 'Vocabulary',
                    subtitle: 'Learn new words and phrases',
                    icon: Icons.menu_book,
                    route: '/vocab',
                    color: Colors.orange.shade100,
                  ),
                  const SizedBox(height: 16),
                  _buildMenuCard(
                    context,
                    title: 'Grammar Quiz',
                    subtitle: 'Test your knowledge',
                    icon: Icons.quiz,
                    route: '/quiz',
                    color: Colors.green.shade100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required String route,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.black87),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Vocabulary Screen ---

class VocabularyItem {
  final String word;
  final String definition;
  final String example;

  VocabularyItem({
    required this.word,
    required this.definition,
    required this.example,
  });
}

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  final List<VocabularyItem> _vocabList = [
    VocabularyItem(
      word: 'Resilient',
      definition: 'Able to withstand or recover quickly from difficult conditions.',
      example: 'Babies are generally far more resilient than new parents realize.',
    ),
    VocabularyItem(
      word: 'Eloquent',
      definition: 'Fluent or persuasive in speaking or writing.',
      example: 'She made an eloquent appeal for action.',
    ),
    VocabularyItem(
      word: 'Pragmatic',
      definition: 'Dealing with things sensibly and realistically in a way that is based on practical rather than theoretical considerations.',
      example: 'We need to adopt a pragmatic approach to the problem.',
    ),
    VocabularyItem(
      word: 'Meticulous',
      definition: 'Showing great attention to detail; very careful and precise.',
      example: 'He had always been so meticulous about his appearance.',
    ),
    VocabularyItem(
      word: 'Inevitable',
      definition: 'Certain to happen; unavoidable.',
      example: 'The compromise was the inevitable result of the negotiations.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocabulary'),
        backgroundColor: Colors.orange.shade100,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _vocabList.length,
              itemBuilder: (context, index) {
                final item = _vocabList[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.word,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.definition,
                          style: const TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        const Divider(height: 24),
                        Text(
                          'Example:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '"${item.example}"',
                          style: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// --- Quiz Screen ---

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _showResult = false;
  int? _selectedAnswerIndex;
  bool _answered = false;

  final List<QuizQuestion> _questions = [
    QuizQuestion(
      question: 'She ___ to the store yesterday.',
      options: ['go', 'goes', 'went', 'gone'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      question: 'I have been studying English ___ three years.',
      options: ['since', 'for', 'in', 'during'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'Which word is a synonym for "happy"?',
      options: ['sad', 'angry', 'joyful', 'tired'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      question: 'If it rains tomorrow, we ___ at home.',
      options: ['stay', 'will stay', 'stayed', 'would stay'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'They haven\'t finished their homework ___.',
      options: ['already', 'still', 'yet', 'just'],
      correctAnswerIndex: 2,
    ),
  ];

  void _submitAnswer(int index) {
    if (_answered) return;

    setState(() {
      _selectedAnswerIndex = index;
      _answered = true;
      if (index == _questions[_currentQuestionIndex].correctAnswerIndex) {
        _score++;
      }
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      if (_currentQuestionIndex < _questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _answered = false;
          _selectedAnswerIndex = null;
        });
      } else {
        setState(() {
          _showResult = true;
        });
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _showResult = false;
      _answered = false;
      _selectedAnswerIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grammar Quiz'),
        backgroundColor: Colors.green.shade100,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: _showResult ? _buildResultView() : _buildQuizView(),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizView() {
    final question = _questions[_currentQuestionIndex];
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LinearProgressIndicator(
            value: (_currentQuestionIndex + 1) / _questions.length,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green.shade400),
          ),
          const SizedBox(height: 24),
          Text(
            'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(
            question.question,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView.builder(
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                Color buttonColor = Colors.white;
                Color textColor = Colors.black87;
                Color borderColor = Colors.grey.shade300;

                if (_answered) {
                  if (index == question.correctAnswerIndex) {
                    buttonColor = Colors.green.shade100;
                    borderColor = Colors.green;
                  } else if (index == _selectedAnswerIndex) {
                    buttonColor = Colors.red.shade100;
                    borderColor = Colors.red;
                  }
                } else if (_selectedAnswerIndex == index) {
                  buttonColor = Colors.blue.shade50;
                  borderColor = Colors.blue;
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: InkWell(
                    onTap: () => _submitAnswer(index),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: buttonColor,
                        border: Border.all(color: borderColor, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        question.options[index],
                        style: TextStyle(
                          fontSize: 18,
                          color: textColor,
                          fontWeight: _answered && index == question.correctAnswerIndex
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultView() {
    final percentage = _score / _questions.length;
    String message = 'Good effort!';
    if (percentage == 1.0) {
      message = 'Perfect! Outstanding job!';
    } else if (percentage >= 0.8) {
      message = 'Great work!';
    } else if (percentage < 0.5) {
      message = 'Keep practicing!';
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            percentage >= 0.5 ? Icons.emoji_events : Icons.school,
            size: 100,
            color: percentage >= 0.5 ? Colors.amber : Colors.blueAccent,
          ),
          const SizedBox(height: 24),
          Text(
            message,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            'You scored $_score out of ${_questions.length}',
            style: const TextStyle(fontSize: 20, color: Colors.black87),
          ),
          const SizedBox(height: 48),
          ElevatedButton.icon(
            onPressed: _restartQuiz,
            icon: const Icon(Icons.refresh),
            label: const Text('Try Again', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              backgroundColor: Colors.green.shade400,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Back to Home', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
