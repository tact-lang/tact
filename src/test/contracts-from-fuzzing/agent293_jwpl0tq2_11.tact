struct SerializeTest {
    a: Int as int32;
    b: Int as uint32;
    c: Bool;
    d: String;
}

contract StorageSerialize {
    val: SerializeTest;

    init() {
        self.val = SerializeTest{a: -123, b: 123, c: true, d: "ok"};
    }
}