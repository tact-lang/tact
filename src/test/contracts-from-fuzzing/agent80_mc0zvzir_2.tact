fun nestedReturn(x: Int): Int {
    {
        if (x > 0) {
            return x * 2;
        }
    }
    return x;
}
