struct S {
    nestedOpt: Int?;
    innerStr: String;
    innerBool: Bool;
}

contract OptionalMix {
    storage: S?;

    init() {
        self.storage = S{
            nestedOpt: null,
            innerStr: "txt",
            innerBool: false,
        };
    }
}