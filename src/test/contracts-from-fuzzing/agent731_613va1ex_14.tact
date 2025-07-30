struct RecursiveWrap {
    content: Wrapper;
}

struct Wrapper {
    value: Int = 1;
    optBool: Bool?;
    description: String = "desc";
}

contract NestedMixedOpt {
    data: RecursiveWrap;

    init() {
        self.data = RecursiveWrap{
            content: Wrapper{ value: 7, optBool: null, description: "d" }
        };
    }
}