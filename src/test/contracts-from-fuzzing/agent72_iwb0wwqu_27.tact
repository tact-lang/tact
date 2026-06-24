struct SerialNesting {
    a: Int as uint8;
    b: Int as uint16;
    c: Int;
}

contract SerialNestedField {
    f: SerialNesting;
    
    init() {
        self.f = SerialNesting{
            a:5,
            b:100,
            c:1000
        };
    }
}