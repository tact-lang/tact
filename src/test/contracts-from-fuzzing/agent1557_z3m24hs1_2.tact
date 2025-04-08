struct DeepNested {
    value: Bool;
}

struct Nested {
    deep: DeepNested;
}

struct Container {
    item: Nested;
}

contract NestedStructContract {
    data: Container;

    init() {
        self.data = Container{ item: Nested{ deep: DeepNested{ value: false } } };
    }
}