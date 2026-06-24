fun testTryCatch() : Int {
    try {
         throw(101);
         // no return here since not reachable
    } catch (err) {
         return err;
    }
}

fun main() : Int {
    return testTryCatch(); // Expect to return 101 since we are throwing and catching
}
