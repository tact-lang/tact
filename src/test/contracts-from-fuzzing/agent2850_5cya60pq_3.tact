struct DeepNested {
    innermost: String;
}

struct Nested {
    deep: DeepNested;
}

struct Outer {
    nested: Nested;
}

contract DeepNestTest {
    field: Outer;

    init() {
        self.field = Outer{ nested: Nested{ deep: DeepNested{ innermost: "X" } } };
    }
}