struct SerializeTest {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;
    d: Bool;
}

contract SerializedFieldsContract {
    data: SerializeTest = SerializeTest{a:1, b:12345, c:ton("1"), d:true};

    init() {
        self.data = SerializeTest{a:255, b:-54321, c:0, d:false};
    }
}