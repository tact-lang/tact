struct Small {
    v: Int as uint4;
}

struct Mid {
    s: Small;
    w: Int as int8;
}

struct Big {
    m: Mid;
    z: Int as uint16;
}

contract SerialBits {
    data: Big;

    init() {
        self.data = Big{
            m: Mid{
                s: Small{v: 7},
                w: -5,
            },
            z: 255,
        };
    }

    receive() {}
}