struct Leaf {
    x: Int as int8;
    y: Int as uint16;
}

struct Middle {
    l: Leaf;
    z: Int as coins;
}

struct Root {
    m: Middle;
    a: Int as int4;
}

contract SerializeNest {
    s: Root = Root {
        m: Middle {
            l: Leaf { x: -5, y: 255 },
            z: 1000000000
        },
        a: 7
    };

    init() {
        self.s = Root {
            m: Middle {
                l: Leaf { x: 3, y: 65535 },
                z: 42
            },
            a: 2
        };
    }

    receive() {}
}