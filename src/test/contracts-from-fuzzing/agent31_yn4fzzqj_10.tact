const A: Int = ascii("abc");

contract Test {
    get fun ret(): Int {
         // Return the ascii value of "abc"
         return A;
    }

    receive() {}
}
