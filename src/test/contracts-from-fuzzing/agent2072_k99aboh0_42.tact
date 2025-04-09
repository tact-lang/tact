struct Leaf {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int64;
}

struct Middle {
    m1: Leaf;
    m2: Leaf;
    flag: Bool;
}

struct Outer {
    top: Middle;
    enabled: Bool = true;
    count: Int as uint32 = 42;
}

contract SizingStress {
    core: Outer;

    init() {
        self.core = Outer{
            top: Middle{
                m1: Leaf{ a:1, b:2, c:3 },
                m2: Leaf{ a:4, b:5, c:6 },
                flag: true
            },
            enabled: false,
            count: 777
        };
    }
}