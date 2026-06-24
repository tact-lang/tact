struct One {
    a: Int as uint8;
}

struct Two {
    b: Int as uint16;
    o: One;
}

struct Three {
    c: Int as uint24;
    t: Two;
}

struct Four {
    d: Int as uint32;
    th: Three;
}

struct Five {
    e: Int as uint64;
    f: Four;
}

contract TestCompression {
    data: Five;

    init() {
        self.data = Five{
            e: 1,
            f: Four{
                d: 2,
                th: Three{
                    c: 3,
                    t: Two{
                        b: 4,
                        o: One{
                            a: 5
                        }
                    }
                }
            }
        };
    }
}