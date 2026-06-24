struct Complex {
    flag: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    data: String;
    optionalField: Int?;
}

contract ComplexTypes {
    d: Complex;

    init() {
        self.d = Complex{
            flag: true,
            inner: InnerStruct{
                data: "data",
                optionalField: null
            }
        };
    }
}
