// Many Ints with explicit serialization options
struct IntsS {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int;
    e: Int as uint64;
}

contract TestContract {
    ints: IntsS;

    init() {
        self.ints = IntsS { a:1, b:2, c:3, d:4, e:5 };
    }
}