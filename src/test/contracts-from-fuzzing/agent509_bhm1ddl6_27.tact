struct InnerStruct {
    x: Int;
    y: Bool?;
}

struct OuterStruct {
    a: Int;
    b: Bool;
    c: String?;
    d: InnerStruct;
}

contract MixedFieldsInit {
    store: OuterStruct;

    init() {
        self.store = OuterStruct{
            a: 42,
            b: true,
            c: null,
            d: InnerStruct{ x: 7, y: false }
        };
    }
}