struct IntWithSerialization {
    a: Int as uint8;
    b: Int as int64;
}

contract SerializationMismatchTest {
    data: IntWithSerialization;

    init() {
        self.data = IntWithSerialization{a:255,b:-10000};
    }

    receive() {
        self.data = IntWithSerialization{a:0,b:10000};
    }
}