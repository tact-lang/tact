struct OptionalInOptional {
    innerOpt: Int?;
    text: String = "a";
}

contract UpperOpt {
    myOpt: OptionalInOptional?;

    init() {
        self.myOpt = OptionalInOptional{
            innerOpt: 42,
            text: "b"
        };
    }
}