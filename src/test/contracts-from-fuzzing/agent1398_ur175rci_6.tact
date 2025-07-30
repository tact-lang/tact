struct InnerA {
    valA: Int;
    optA: Bool?;
}

struct InnerB {
    valB: String;
    optB: Int?;
}

struct Middle {
    innerA: InnerA;
    innerB: InnerB;
    flag: Bool;
}

contract MultiNestedOptional {
    content: Middle;

    init() {
        self.content = Middle{
            innerA: InnerA{ valA: 1, optA: true },
            innerB: InnerB{ valB: "hello", optB: null },
            flag: true
        };
    }
}