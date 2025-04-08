struct Inner {
    optInt: Int?;
    optBool: Bool?;
    str: String;
}

contract OptionalMix {
    data: Inner?;

    init() {
        self.data = Inner{
            optInt: 10,
            optBool: false,
            str: "hi"
        };
    }
}
