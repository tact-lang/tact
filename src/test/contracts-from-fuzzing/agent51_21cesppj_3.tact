struct NestedLevel2 {
    x: Int;
    y: Bool;
}

struct NestedLevel1 {
    a: NestedLevel2;
    b: NestedLevel2;
}

contract DeepNestedStructFields {
    n1: NestedLevel1;

    init() {
        self.n1 = NestedLevel1{
            a: NestedLevel2{ x: 10, y: true },
            b: NestedLevel2{ x: 20, y: false },
        };
    }
}