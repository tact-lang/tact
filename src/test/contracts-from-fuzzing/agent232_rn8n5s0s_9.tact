struct Tiny {
    f1: Int as int8;
    f2: Int as uint4;
    f3: Bool;
}

contract TinyStorage {
    t: Tiny;

    init() {
        self.t = Tiny{ f1: -7, f2: 15, f3: true };
    }
}