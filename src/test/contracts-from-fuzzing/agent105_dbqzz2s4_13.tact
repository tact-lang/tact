contract TestGetterNestedReturn {
    get fun testGetter(): Int {
        {
            if (1 < 2) {
                return 5;
            }
        }
        return 10;
    }
}
