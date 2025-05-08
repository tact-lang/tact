struct DeepLevel3 {
    x: Bool;
}

struct DeepLevel2 {
    dl3: DeepLevel3;
}

struct DeepLevel1 {
    dl2: DeepLevel2;
}

contract DeepNestedStructTest {
    nested: DeepLevel1;

    init() {
        self.nested = DeepLevel1{ dl2: DeepLevel2{ dl3: DeepLevel3{ x: false } } };
    }
}