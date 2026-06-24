struct Complex {
    numb: Int;
    optional: Int?;
    flag: Bool;
    txt: String;
}

contract ComplexContract {
    c: Complex;

    init() {
        self.c = Complex{
            numb: 17,
            optional: null,
            flag: true,
            txt: "hi"
        };
    }
}