struct SampleStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
}

contract StructFieldStorage {
    sample: SampleStruct;
    
    init() {
        self.sample = SampleStruct{
            a: 42,
            b: null,
            c: true,
            d: "testing",
        };
    }
}