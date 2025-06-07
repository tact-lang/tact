struct NestedDefaults2 {
    foo: Int = 42;
    bar: Bool = false;
}

struct OuterDefaults2 {
    baz: NestedDefaults2 = NestedDefaults2{};
}

contract DefaultsNested2 {
    val: OuterDefaults2;

    init() {
        self.val = OuterDefaults2{};
    }
}