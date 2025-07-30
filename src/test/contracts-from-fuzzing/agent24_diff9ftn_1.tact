struct DeepLevel {
    a: Int;
    b: Int?;
}

struct MiddleLevel {
    deep: DeepLevel;
    flag: Bool;
}

contract NestedContract {
    nested: MiddleLevel;

    init() {
        self.nested = MiddleLevel{ deep: DeepLevel{ a: 42, b: null }, flag: true };
    }
}