struct DeepInner { a: Int; b: String }

struct Middle {
    nested: DeepInner;
    optional: Bool?;
}

struct Outer {
    mid: Middle;
    flag: Bool;
}

contract Fuzz {
    state: Outer;

    init() {
        self.state = Outer{
            mid: Middle{
                nested: DeepInner{
                    a: 42,
                    b: "deep"
                },
                optional: null
            },
            flag: true
        };
    }
}
