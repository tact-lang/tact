struct Complex {
    int1: Int;
    bool1: Bool?;
    str1: String;
    int2: Int?;
    bool2: Bool;
    str2: String?;
}

contract ComplexStorage {
    c: Complex;

    init() {
        self.c = Complex{
            int1: 1,
            bool1: null,
            str1: "hi",
            int2: 2,
            bool2: true,
            str2: null
        };
    }
}