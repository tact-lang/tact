fun ct_add(a: Int, b: Int): Int {
    return a + b;
}

contract Test {
    value: Int = ct_add(2, 3);
}