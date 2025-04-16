struct DeepNested {
    val: Int = 5;
}

struct Nested {
    deep: DeepNested;
}

contract DeepContract {
    nested: Nested;

    init() {
        self.nested = Nested{ deep: DeepNested{} };
    }
}