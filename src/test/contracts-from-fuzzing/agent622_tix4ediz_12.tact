struct Leaf {
    x: Int;
}

struct Mid1 {
    leaf: Leaf?;
    flag: Bool;
}

struct Mid2 {
    mid1: Mid1?;
    flag2: Bool;
}

struct Mid3 {
    mid2: Mid2?;
    flag3: Bool;
}

contract OptionalNestedStructs {
    data: Mid3;

    init() {
        self.data = Mid3{
            mid2: null,
            flag3: true
        };
    }
}