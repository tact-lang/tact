struct InnerMost {
    a: Int;
    b: Bool;
}

struct Middle {
    x: InnerMost;
    y: String;
}

struct Outer {
    m: Middle;
    z: Address;
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{
            m: Middle{
                x: InnerMost{ a: 1, b: true },
                y: "deepnest",
            },
            z: myAddress(),
        };
    }
}
