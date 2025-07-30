struct SubNested {
    x: Int;
    y: Bool;
}

struct Nested {
    sub1: SubNested;
    sub2: SubNested;
    s: String;
}

contract NestedAsVar {
    nested1: Nested;
    nested2: Nested;

    init() {
        self.nested1 = Nested{
            sub1: SubNested{ x: 1, y: true },
            sub2: SubNested{ x: 2, y: false },
            s: "hi",
        };
        self.nested2 = self.nested1;
    }
}