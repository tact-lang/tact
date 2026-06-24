/* Test 4: Field Punning Test
   Expected: Compiles successfully and returns 52.
*/

struct PopQuiz {
    vogonsCount: Int;
    nicestNumber: Int;
}

fun main(): Int {
    let vogonsCount: Int = 42;
    let nicestNumber: Int = 10;
    let pq = PopQuiz{ vogonsCount, nicestNumber, };
    return pq.vogonsCount + pq.nicestNumber;
}
