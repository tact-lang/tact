struct NestedSerialize {
    a: Int as uint8;
    b: Int as int32;
}

contract NestedSerializeContract {
    s: NestedSerialize;

    init() {
        self.s = NestedSerialize{ a: 5, b: -10 };
    }
}