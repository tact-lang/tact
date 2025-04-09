struct WrapperOpt {
    optInt: Int?;
    optBool: Bool?;
    optText: String?;
}

contract NestedOptionals {
    inner: WrapperOpt?;
    init() {
        self.inner = WrapperOpt{
            optInt: 5,
            optBool: null,
            optText: "yo"
        };
    }
}