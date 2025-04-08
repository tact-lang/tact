struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract Test {
    value: DeepOptionals = DeepOptionals{
        a: null,
        b: true,
        c: null,
        d: null
    };

    receive() {}
}