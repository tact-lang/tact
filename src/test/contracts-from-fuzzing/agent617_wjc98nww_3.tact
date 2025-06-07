struct InnerMost {
    val: Int;
    flag: Bool;
}

struct Mid {
    nested: InnerMost;
    txt: String;
}

struct Outer {
    middle: Mid;
    address: Address;
}

contract DeepNested {
    s: Outer;

    init() {
        self.s = Outer{
            middle: Mid{
                nested: InnerMost{ val: 7, flag: false },
                txt: "hi"
            },
            address: myAddress()
        };
    }
}
