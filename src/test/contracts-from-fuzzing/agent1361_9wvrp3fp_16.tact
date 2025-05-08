struct PartA {
    foo: Int?;
}

struct PartB {
    bar: Bool?;
}

struct Parts {
    a: PartA;
    b: PartB;
}

contract NestedOptionals {
    store: Parts;

    init() {
        self.store = Parts{a: PartA{foo: null}, b: PartB{bar: null}};
    }
}