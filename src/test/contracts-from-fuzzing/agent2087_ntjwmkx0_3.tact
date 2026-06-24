struct Level2 {
    val: Int;
}

struct DeepNested {
    sub: Level2;
}

contract DeepStorage {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{sub: Level2{val: 1}};
    }
}