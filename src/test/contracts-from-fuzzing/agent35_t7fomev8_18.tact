struct HasOptional {
    i: Int?;
    s: String?;
}

struct Complex {
    optStruct: HasOptional?;
    flag: Bool;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            optStruct: null,
            flag: true,
        };
    }
}
