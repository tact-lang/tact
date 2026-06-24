struct NestedLevel2 {
    c: Bool;
}

struct NestedLevel1 {
    b: NestedLevel2;
}

struct NestedRoot {
    a: NestedLevel1;
}

contract TestContract {
    nested: NestedRoot;

    init() {
        self.nested = NestedRoot{ a: NestedLevel1{ b: NestedLevel2{ c: true } } };
    }
}