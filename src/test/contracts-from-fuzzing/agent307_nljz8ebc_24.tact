struct AAA {
    a: Int;
}

struct BBB {
    b: AAA;
}

contract NestedSingleField {
    store: BBB;
    init() {
        self.store = BBB{ b: AAA{ a: 123 } };
    }
}