struct InnerMost {
    i1: Int;
    b1: Bool;
    s: String;
}

struct Inner {
    im: InnerMost;
    optStr: String?;
}

struct Outer {
    inr: Inner;
    addr: Address;
    bigInt: Int;
}

contract DeepNestedFields {
    val: Outer;

    init() {
        self.val = Outer{
            inr: Inner{
                im: InnerMost{ i1: 42, b1: true, s: "hi" },
                optStr: null
            },
            addr: myAddress(),
            bigInt: 999999
        };
    }

    receive() {
        let v = self.val;
    }
}