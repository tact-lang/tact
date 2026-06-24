struct StringNest {
    info: String;
    comment: String?;
}

struct WithString {
    s: String;
    opt: StringNest;
}

contract StringStructs {
    data: WithString;

    init() {
        self.data = WithString{
            s: "hello",
            opt: StringNest{info: "world", comment: null},
        };
    }
}