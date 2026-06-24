contract Fuzz38 {
    foo: Int as int4;

    init() {
        self.foo = 10; // out of range for int4 (-8..7)
    }
}