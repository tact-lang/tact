struct WithSerialization {
    a: Int as uint8;
    b: Int as int32;
    c: Bool;
    d: String;
}

contract SerializedTest {
    val: WithSerialization;

    init() {
        self.val = WithSerialization{ a: 255, b: -1000, c: true, d: "hi" };
    }
}
