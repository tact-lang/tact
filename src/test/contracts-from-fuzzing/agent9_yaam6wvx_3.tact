struct PopQuiz {
    vogonsCount: Int;
    nicestNumber: Int;
}

fun main() : Int {
    let vogonsCount: Int = 42;
    let nicestNumber: Int = 10;
    let quiz = PopQuiz{ vogonsCount, nicestNumber };
    return quiz.vogonsCount + quiz.nicestNumber; // Expecting 52
}
