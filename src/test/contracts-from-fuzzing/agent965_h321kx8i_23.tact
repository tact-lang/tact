struct OptWrapOpt {
    a: Int?;
    b: Bool?;
    c: StrWrap?;
}

struct StrWrap {
    text: String;
}

contract NestedOptWrap {
    val: OptWrapOpt;

    init() {
        self.val = OptWrapOpt{
            a: null,
            b: null,
            c: null,
        };
    }
}