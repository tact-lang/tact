// persistent struct using various primitive serialization formats
struct SerializedTest {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int8;
    d: Int as uint4;
}

contract TestContract {
    val: SerializedTest;

    init() {
        self.val = SerializedTest{
            a: -1234567890123,
            b: 123456,
            c: 42,
            d: 9
        };
    }
}