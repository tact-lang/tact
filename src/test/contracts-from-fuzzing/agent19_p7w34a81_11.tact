struct Base {
    val: Int;
}

struct Mid1 {
    base: Base;
    flag: Bool;
}

struct Mid2 {
    mid1: Mid1;
    num: Int;
    optStr: String?;
}

contract NestedMultipleLevels {
    data: Mid2;

    init() {
        self.data = Mid2{
            mid1: Mid1{
                base: Base{ val: 5 },
                flag: true,
            },
            num: 42,
            optStr: "foo",
        };
    }
}