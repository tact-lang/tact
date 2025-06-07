struct OptWrap {
    innerOpt: Int?;
    innerOptBool: Bool?;
    innerOptStr: String?;
}

struct ComposeOpt {
    one: OptWrap?;
    two: OptWrap?;
}

contract TestNestedOptionalFields {
    content: ComposeOpt;

    init() {
        self.content = ComposeOpt{
            one: null,
            two: null
        };
    }
}