struct Tiny {
    f: Int as uint1;
}

contract TinyStruct {
    t: Tiny;

    init() {
        self.t = Tiny{ f: 1 };
    }
}