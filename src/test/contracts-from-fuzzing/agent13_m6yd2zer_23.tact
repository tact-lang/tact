contract TestGetterModify {
    v: Int;

    init() {
        self.v = 0;
    }

    // According to documentation, getters can modify state variables, but changes won't persist
    get fun test(): Int {
        self.v += 1;
        return self.v;
    }

    receive() {
        let a: Int = self.test();
        let b: Int = self.v;
        dump(a); // expected: 1
        dump(b); // expected: 1
    }
}
