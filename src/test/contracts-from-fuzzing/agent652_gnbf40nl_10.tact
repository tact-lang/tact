struct MixedOptionalsNested {
    basic: Bool;
    optInt: Int?;
    nested: Inner?
}

struct Inner {
    x: Int;
    y: InnerMost?;
}

struct InnerMost {
    message: String;
}

contract TestContract {
    s: MixedOptionalsNested;

    init() {
        self.s = MixedOptionalsNested{
            basic: false,
            optInt: null,
            nested: Inner{
                x: 123,
                y: InnerMost{message: "hi"}
            }
        };
    }
}