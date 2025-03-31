struct PopQuiz {
    count: Int;
    status: Bool;
}

fun testPunning() {
    let count: Int = 10;
    let status: Bool = true;
    let pq = PopQuiz { count, status, };
}

fun main() {
    testPunning();
}
