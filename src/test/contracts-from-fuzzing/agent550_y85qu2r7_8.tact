struct ReorderFields {
    a: Int as uint8;
    b: Int;
    c: Int as uint16;
    d: Int as int64;
    e: Int;
}

contract SerializationOrder {
    s: ReorderFields;

    init() {
        self.s = ReorderFields{
            a:1, b:2, c:3, d:4, e:5
        };
    }
}