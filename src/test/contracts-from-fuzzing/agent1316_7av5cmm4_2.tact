struct Nested {
    foo: Int = 1;
    bar: Bool? = null;
}

struct Outer {
    nest: Nested;
    flag: Bool = false;
}

contract Test {
    item: Outer = Outer{nest: Nested{foo: 3, bar: true}, flag: true};

    init() {
        self.item = Outer{nest: Nested{foo: 2, bar: false}, flag: false};
    }
}
