struct Tiny {
    a: Int;
    b: Int as int64;
}

contract SerializationMixing {
    t: Tiny;

    init() {
        self.t = Tiny{
            a: 1,
            b: 2
        };
    }
}