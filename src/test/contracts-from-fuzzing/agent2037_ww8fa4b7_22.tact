struct ConstantsMixed {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: String?;
    e: Int?;
}

contract ConstantsOptionals {
    val: ConstantsMixed;

    init() {
        self.val = ConstantsMixed{
            a: 42,
            b: true,
            c: "yo",
            d: null,
            e: null
        };
    }
}
