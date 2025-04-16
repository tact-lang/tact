fun nestedReturn(): Int {
    {
        if (true) { return 1; }
    }
    return 2;
}
