struct InnerA {
    a: Int;
}

struct InnerB {
    b: Bool;
}

struct CombineNested {
    first: InnerA;
    second: InnerB;
}

contract NestedCombine {
    val: CombineNested;

    init() {
        self.val = CombineNested{
            first: InnerA{ a: 42 },
            second: InnerB{ b: true }
        };
    }
}