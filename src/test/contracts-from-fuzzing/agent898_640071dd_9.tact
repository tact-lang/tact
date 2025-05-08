struct NestedOptionalString {
    foo: String?;
    bar: LevelTwo?;
}

struct LevelTwo {
    baz: String?;
}

contract TestOptString {
    data: NestedOptionalString;
    init() {
        self.data = NestedOptionalString{
            foo: null,
            bar: null,
        };
    }
}
