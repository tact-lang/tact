struct WithSerialization {
    a: Int as uint8;
    b: Int as int64;
    c: Address;
    d: Bool;
}

contract SerializeTest {
    data: WithSerialization;

    init() {
        self.data = WithSerialization{
            a: 255, b: -1000, c: myAddress(), d: true
        };
    }
}