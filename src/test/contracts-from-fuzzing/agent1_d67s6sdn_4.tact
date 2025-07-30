struct PopQuiz {
    vogonsCount: Int;
    nicestNumber: Int;
}

fun test_punning() : Int {
    let vogonsCount: Int = 42;
    let nicestNumber: Int = 69;
    let p = PopQuiz{ vogonsCount, nicestNumber, };
    return p.vogonsCount + p.nicestNumber;
}
