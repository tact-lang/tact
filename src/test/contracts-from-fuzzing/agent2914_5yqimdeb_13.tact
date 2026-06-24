struct Serialized {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint256;
    d: Bool;
}

contract SerializedFieldsContract {
    s: Serialized;

    init() {
        self.s = Serialized{ a: 5, b: -1000, c: 10, d: true };
    }
}