struct NestedLevel2 {
    d: Int;
}

struct NestedLevel1 {
    c: NestedLevel2;
}

struct Root {
    a: Int;
    b: NestedLevel1;
}

contract NestedStructs {
    r: Root;

    init() {
        self.r = Root{
            a: 3,
            b: NestedLevel1{ c: NestedLevel2{ d: 5 } },
        };
    }
}