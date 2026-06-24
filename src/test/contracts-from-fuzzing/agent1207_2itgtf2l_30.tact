struct SerialOps {
    a: Int as uint4;
    b: Int as int4;
    c: Int as uint7;
}

contract TinyShorts {
    f: SerialOps;

    init() {
        self.f = SerialOps{ a: 15, b: -8, c: 127 };
    }
}