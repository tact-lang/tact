fun ct_func(x: Int): Int {
    if (x == 42) {
        return 1;
    }
    return 0;
}

contract Test {
    const res: Int = ct_func(42);
}
