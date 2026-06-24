struct DeepStr {
    text: String;
    optText: String?;
}

struct WrapDeep {
    deep: DeepStr;
}

contract NestedStringOpt {
    data: WrapDeep;

    init() {
        self.data = WrapDeep{
            deep: DeepStr{
                text: "abc",
                optText: null,
            },
        };
    }
}