struct MixedStruct {
    a: Int;
    b: Bool?;
    c: String;
    d: String?;
}

contract MixedTypesTest {
    f1: MixedStruct;

    init() {
        self.f1 = MixedStruct{
            a: 1,
            b: null,
            c: "hello",
            d: null
        };
    }
}
