struct OptStructs {
    a: Int?;
    b: String?;
    c: Bool?;
    d: DeepStruct?;
}

struct DeepStruct {
    foo: Int;
    bar: String;
    baz: Bool;
}

contract OptionalFieldsContract {
    data: OptStructs;

    init() {
        self.data = OptStructs{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}