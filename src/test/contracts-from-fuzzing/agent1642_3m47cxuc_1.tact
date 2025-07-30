struct NestedDeeply {
    innermost: Int;
}

struct Middle {
    nested: NestedDeeply;
}

struct Outer {
    middle: Middle;
}

contract DeepNestingTest {
    value: Outer;

    init() {
        self.value = Outer{middle: Middle{nested: NestedDeeply{innermost: 42}}};
    }
}