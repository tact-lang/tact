struct NestedEmbedded {
    n: Int;
    sub: SubNested;
}

struct SubNested {
    f: Bool;
    msg: String;
}

contract TestContract {
    val: NestedEmbedded;
    init() {
        self.val = NestedEmbedded {
            n: 7,
            sub: SubNested { f: false, msg: "nested" }
        };
    }
}