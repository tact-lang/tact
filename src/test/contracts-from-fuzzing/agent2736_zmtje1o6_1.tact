struct NestedLevel3 {
    a: Int;
    b: Bool;
}

struct NestedLevel2 {
    n3: NestedLevel3;
    s: String;
}

struct NestedLevel1 {
    optNest: NestedLevel2?;
    n: Int;
}

contract DeepNestedTest {
    nestedField: NestedLevel1;

    init() {
        self.nestedField = NestedLevel1{
            optNest: null,
            n: 42,
        };
    }
}