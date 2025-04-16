struct Complex {
    name: String;
    age: Int?;
    flag: Bool?;
    desc: String?;
}

contract MixedOptionalStruct {
    data: Complex;
    init() {
        self.data = Complex{
            name: "Alpha",
            age: null,
            flag: true,
            desc: null
        };
    }
}