struct MultiSerialize {
    a: Int as uint8;
    b: Int as int4;
    c: Int as uint32;
}

contract SerializeVariantsContract {
    storage: MultiSerialize;
    init() {
        self.storage = MultiSerialize{ a: 10, b: -3, c: 999 };
    }
}