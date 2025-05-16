contract Test {
    foo: Int as uint4 = 15;
    bar: Int;

    init() {
        self.bar = 16; // outside the range of uint4
        self.foo = self.bar; // assign invalid into foo
    }
}