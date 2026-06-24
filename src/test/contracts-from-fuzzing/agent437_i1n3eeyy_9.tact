struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
}

struct Outer {
    inner1: NestedOptionals = NestedOptionals{};
    inner2: NestedOptionals = NestedOptionals{};
}

contract OptionNest {
    store: Outer = Outer{};

    init() {
        self.store = Outer{
            inner1: NestedOptionals{a: 1, b: true, c: null},
            inner2: NestedOptionals{a: null, b: null, c: null}
        };
    }

    receive() {
        if (self.store.inner1.a != null) {
            let _ = self.store.inner1.a!!;
        }
    }
}