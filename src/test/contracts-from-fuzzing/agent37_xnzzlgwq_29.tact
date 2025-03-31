contract ComplexGetter {
    get fun getVal(): Int {
        {
            if (true) { return 5; }
            return 6;
        }
    }
}
