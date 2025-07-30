struct InnerStruct {
    a: Int;
    b: Int?;
    c: String;
    d: Bool;
}

contract ManyFields {
    storage: InnerStruct;

    init() {
        self.storage = InnerStruct{
            a: 42,
            b: null,
            c: "hello",
            d: true,
        };
    }
}