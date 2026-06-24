struct EmptyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

struct NestedEmpty {
    empty: EmptyOptionals?;
    label: String;
}

contract Test {
    val: NestedEmpty;
    init() {
        self.val = NestedEmpty{
            empty: null,
            label: "label"
        };
    }
}