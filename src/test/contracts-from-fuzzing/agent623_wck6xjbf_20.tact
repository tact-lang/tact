struct InnerOpt {
    flag: Bool?;
    message: String?;
}

struct WrapperOpt {
    inner: InnerOpt?;
}

contract NestedOptStructs {
    val: WrapperOpt;

    init() {
        self.val = WrapperOpt{
            inner: InnerOpt{
                flag: true,
                message: "hi",
            },
        };
    }
}