struct InnerOptional {
    optInt: Int?;
    optBool: Bool?;
}

struct OuterOptional {
    nestedOpt: InnerOptional?;
    someText: String;
}

contract OptionalsNested {
    storage: OuterOptional;

    init() {
        self.storage = OuterOptional{
            nestedOpt: InnerOptional{
                optInt: null,
                optBool: true
            },
            someText: "hi"
        };
    }
}