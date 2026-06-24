// struct with explicit serialization plus optionals
struct SerialStruct {
    a: Int as uint8;
    b: Int?;
    c: Bool?;
    d: Int as int64;
}

contract SerialOptField {
    s: SerialStruct;

    init() {
        self.s = SerialStruct{a:1, b:null, c:null, d:2};
    }
}