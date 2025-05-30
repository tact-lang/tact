struct Param {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
}

contract SerializedFields {
    data: Param;

    init() {
        self.data = Param{ a:1, b:2, c:3 };
    }
}