// Chain of nested structs with mix of primitives and optionals
struct InnerMost {
    a: Int;
    b: String?;
}

struct MiddleX {
    inner: InnerMost?;
    flag: Bool;
}

struct MiddleY {
    inner: InnerMost;
    note: String?;
}

struct TopMix {
    x: MiddleX;
    y: MiddleY?;
    label: String;
}

contract ChainNestedOptions {
    val: TopMix;

    init() {
        self.val = TopMix{
            x: MiddleX{ inner:null, flag:true },
            y: null,
            label: "z"
        };
    }
}