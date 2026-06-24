struct InnerMost {
    i: Int as uint4;
    b: Bool;
}

struct Middle {
    j: InnerMost;
    k: Bool?;
}

struct Outer {
    x: Int;
    y: Middle;
    z: String?;
}

contract SerializeNested {
    val: Outer;

    init() {
        self.val = Outer {
            x: 1,
            y: Middle {
                j: InnerMost {
                    i: 15,
                    b: true
                },
                k: null
            },
            z: null
        };
    }
}