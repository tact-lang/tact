struct SerialOpts {
    a: Int? as uint32;
    b: Int? as int64;
    c: Bool?;
}

contract OptionalWithSerialization {
    data: SerialOpts;

    init() {
        self.data = SerialOpts{a:1, b:2, c:true};
    }
}