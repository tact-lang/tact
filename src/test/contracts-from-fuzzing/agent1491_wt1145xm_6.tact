struct OptionalDeepNest {
    deep: DeepNested?;
}

struct DeepNested {
    sub: SubNested?;
}

struct SubNested {
    foo: Int;
    bar: Bool;
}

contract OptionalDeepNestedField {
    data: OptionalDeepNest;

    init() {
        self.data = OptionalDeepNest{ deep: null };
    }
}