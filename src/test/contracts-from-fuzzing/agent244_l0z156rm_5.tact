fun ctNestedReturn(x: Int): Int {
    {
        if (x > 0) {
            return 10;
        }
    }
    return 20;
}

contract TestNested {
    a: Int = ctNestedReturn(5);
    b: Int = ctNestedReturn(-5);
}
