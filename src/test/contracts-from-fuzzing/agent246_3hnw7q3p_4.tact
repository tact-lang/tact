fun ct_nested(x: Int): Int {
    {
        if (x > 5) {
            return 999;
        }
    }
    return 0;
}

contract Test {
    const a: Int = ct_nested(10);
    const b: Int = ct_nested(2);
}
