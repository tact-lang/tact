struct Complex {
    sub1: Int;
    sub2: Bool?;
    sub3: String;
}

contract OptionalComplex {
    val: Complex?;

    init() {
        self.val = Complex{
            sub1: 100,
            sub2: null,
            sub3: "hi",
        };
    }
}