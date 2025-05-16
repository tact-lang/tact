struct NestedOptional {
    foo: Int?;
    bar: Bool?;
}

struct DeepNested {
    level1: NestedOptional;
    level2: NestedOptional;
}

contract TestContract {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            level1: NestedOptional{foo: 1, bar: true},
            level2: NestedOptional{foo: null, bar: false},
        };
    }
}
