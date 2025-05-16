struct Tiny {
    f1: Int as uint8;
    f2: Bool;
    f3: Int as uint4;
}

contract TinyFields {
    t: Tiny;
    init() {
        self.t = Tiny{
            f1: 255,
            f2: true,
            f3: 15
        };
    }
}