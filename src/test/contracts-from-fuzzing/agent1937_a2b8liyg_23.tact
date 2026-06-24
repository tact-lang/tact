struct Tiny {
    a: Int as uint1;
    b: Bool;
}

contract TinySerializationBits {
    t: Tiny;

    init() {
        self.t = Tiny{ a: 1, b: true };
    }
}
