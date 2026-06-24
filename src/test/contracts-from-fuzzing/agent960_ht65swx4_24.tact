struct InnerStr {
    label: String;
    note: String?;
}

struct OuterStr {
    inner: InnerStr;
    description: String;
}

contract StrNestOpt {
    data: OuterStr;
    init() {
        self.data = OuterStr{
            inner: InnerStr{
                label: "l",
                note: null
            },
            description: "desc"
        };
    }
}