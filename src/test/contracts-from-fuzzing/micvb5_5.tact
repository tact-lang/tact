struct PopQuiz {
    vogonsCount: Int;
    nicestNumber: Int;
}

fun testPunning(): Int {
    let vogonsCount: Int = 42;
    let nicestNumber: Int = 68 + 1;
    // Using field punning for struct instantiation
    let quiz: PopQuiz = PopQuiz { vogonsCount, nicestNumber };
    return quiz.vogonsCount + quiz.nicestNumber;
}

fun main(): Int {
    // Call the test function and return its result
    return testPunning();
}
