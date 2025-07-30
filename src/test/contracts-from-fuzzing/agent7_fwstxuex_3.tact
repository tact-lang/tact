contract Test {
    // Map with key type Int and value type Int using correct angle-bracket syntax
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set a value using .set() which is a mutating function (returns void)
        self.m.set(1, 100);
        let value1 = self.m.get(1)!!; // expect 100
        dump(value1);
    }
}
