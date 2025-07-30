struct Mid {
    a: Int;
    b: Bool;
}

struct Outer {
    mid1: Mid;
    mid2: Mid;
}

contract NestedDuplicateStructs {
    val: Outer;

    init() {
        self.val = Outer{
            mid1: Mid{ a: 1, b: true },
            mid2: Mid{ a: 2, b: false }
        };
    }
}