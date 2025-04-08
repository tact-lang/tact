struct Small {
    a: Int as int4;
    b: Int as uint1;
    c: Int as int8;
    d: Int as uint16;
    e: Int as int257;
}

contract SerializeEdge {
    s: Small;

    init() {
        self.s = Small{ a: -4, b: 1, c: 127, d: 65535, e: 0 };
    }
}
