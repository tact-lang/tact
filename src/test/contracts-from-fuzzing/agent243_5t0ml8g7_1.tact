fun compReturn(a: Int): Int {
    if (a < 10) {
         return a;
    } else {
         return a + 10;
    }
}

contract Test {
    v: Int = compReturn(5);
}