// Serialization of optionals explicitly
struct SerOpts {
    a: Int?;           
    b: Int? as uint8;   // <-- expecting reject? Check
    c: Bool?;          
}

contract OptWithSerdeStruct {
    inner: SerOpts;

    init() {
        self.inner = SerOpts{
            a: null,
            b: null,
            c: null
        };
    }
}