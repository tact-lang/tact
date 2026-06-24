struct Embedded {
    n: Int as int64;
    b: Bool;
}

contract StructSerialization {
    s: Embedded;

    init() {
        self.s = Embedded{ n: 1234, b: true };
    }
}