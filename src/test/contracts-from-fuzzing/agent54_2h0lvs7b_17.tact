contract GetterNestedReturn {
    v: Int = 42;
    receive () {}
    get fun getNested(flag: Bool): Int {
        if (flag) {
            { // extra inner block
                return self.v;
            }
        }
        return self.v + 1;
    }
}
