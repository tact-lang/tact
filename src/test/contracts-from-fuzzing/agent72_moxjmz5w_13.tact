struct NestedOptional {
    innerOpt: Int?;
    flag: Bool;
}

struct NestedWrap {
    content: NestedOptional?;
    desc: String;
}

contract OptWrap {
    data: NestedWrap;

    init() {
        self.data = NestedWrap{
            content: null,
            desc: "desc"
        };
    }
}