struct Inner {
    i: Int;
    b: Bool;
    addr: Address;
}

struct Middle {
    innerOpt: Inner?;
    s: String;
}

struct Outer {
    m: Middle;
}

contract ContractDeepMix {
    outer: Outer;

    init() {
        self.outer = Outer{
            m: Middle{
                innerOpt: null,
                s: "test",
            },
        };
    }
}