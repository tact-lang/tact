struct PopQuiz {
    vogonsCount: Int;
    nicestNumber: Int;
}

fun testPunning() : Int {
    let vogonsCount: Int = 42;
    let nicestNumber: Int = 69;
    let quiz: PopQuiz = PopQuiz{
        vogonsCount,
        nicestNumber,
    };
    return quiz.vogonsCount + quiz.nicestNumber;
}

fun testTryCatch() : Int {
    try {
        throw(100);
    } catch (e) {
        return e;
    }
}

fun testWhile() : Int {
    let x: Int = 10;
    while (x > 0) {
        // The Tact docs show mutable behavior for variables in loops
        x -= 1;
    }
    return x;
}

fun main() : Int {
    // Sum the results of the three tests
    return testPunning() + testTryCatch() + testWhile();
}
