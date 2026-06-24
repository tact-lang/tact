struct HasSerialization {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int8;
}

contract SerializedFields {
    data: HasSerialization;

    init() {
        self.data = HasSerialization{a:1,b:2,c:3};
    }
}