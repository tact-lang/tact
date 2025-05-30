struct DeepStruct1 {
    x: Int;
    y: String;
    z: Bool?;
}

struct DeepStruct2 {
    a: DeepStruct1;
    b: Int;
    c: Bool;
}

contract NestedDeep {
    storage: DeepStruct2;
    init() {
        self.storage = DeepStruct2{
            a: DeepStruct1{ x: 5, y: "str", z: null },
            b: 42,
            c: true
        };
    }
}