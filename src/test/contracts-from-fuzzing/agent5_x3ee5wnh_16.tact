fun testTry() : Int {
    try {
         if (false) {
              throw(42);
         }
         return 10;
    } catch (e) {
         return e + 1;
    }
}

fun main() : Int {
    return testTry();
}
