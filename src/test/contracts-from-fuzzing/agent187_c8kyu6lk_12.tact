struct Mix {
    a: Int as int64;
    b: Int as uint32;
    c: Bool;
    d: String;
}

contract StorageSerializationAttrsTest {
    data: Mix;

    init() {
        self.data = Mix{
            a: -42,
            b: 12345,
            c: true,
            d: "test"
        };
    }
}