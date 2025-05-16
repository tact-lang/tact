fun ctNestedReturn(x: Int): Int {
    if (x < 3) {
         { return 42; }
    }
    return 0;
}

contract Test {
    a: Int = ctNestedReturn(2);
}
