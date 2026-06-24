struct NestedLevel2 {
    f1: Int;
    f2: Bool;
}

struct NestedLevel1 {
    inner: NestedLevel2;
    flag: Bool;
}

contract TestContract {
    nested: NestedLevel1;

    init() {
        self.nested = NestedLevel1{
            inner: NestedLevel2{ f1: 10, f2: false },
            flag: true
        };
    }
}