struct StrNest {
    text: String;
    optional: InnerStr?;
}

struct InnerStr {
    message: String;
    flag: Bool;
}

contract StringOpt {
    data: StrNest;

    init() {
        self.data = StrNest{
            text: "hello",
            optional: InnerStr{
                message: "world",
                flag: true
            }
        };
    }
}