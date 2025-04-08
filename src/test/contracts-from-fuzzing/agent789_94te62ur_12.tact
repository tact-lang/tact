struct SubNested {
    f1: Int;
    f2: Bool;
}

struct NestedWithOptionals {
    foo: SubNested?;
    bar: Bool;
}

contract OptNestedStructTest {
    nestedOpt: NestedWithOptionals;

    init() {
        self.nestedOpt = NestedWithOptionals {
            foo: null,
            bar: true
        };
    }
}
