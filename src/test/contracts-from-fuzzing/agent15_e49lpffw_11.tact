struct DeepStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
}

contract DeepFields {
    s: DeepStruct;

    init() {
        self.s = DeepStruct{
            a: 12, b: false, c: null, d: null, e: 34, f: true
        };
    }
}