struct BigNested {
    a: Int;
    b: Middle;
}

struct Middle {
    x: Bool;
    y: Leaf;
}

struct Leaf {
    p: String;
    q: Address;
    r: InnerOpt?;
}

struct InnerOpt {
    v: Int;
    w: Bool?;
}

contract BigNestedTest {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: 11,
            b: Middle{
                x: true,
                y: Leaf{
                    p: "hello",
                    q: myAddress(),
                    r: InnerOpt{
                        v: 42,
                        w: null
                    }
                }
            }
        };
    }
}
