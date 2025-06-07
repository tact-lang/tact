struct HasSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as int257;
}

contract SerFieldsTest {
    data: HasSerialization;

    init() {
        self.data = HasSerialization{ a:1,b:-5,c:1000 };
    }
}
