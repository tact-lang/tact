contract Fuzz39 {
    foo: Int as uint4;

    init() {
        self.foo = -1; // invalid, can't store negative in uint4
    }
}