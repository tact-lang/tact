struct Complex {
    optNum: Int?;
    str: String;
    flag: Bool;
}

contract OptionalNested {
    c: Complex?;

    init() {
        self.c = Complex{optNum: null, str: "hi", flag: true};
    }
}
