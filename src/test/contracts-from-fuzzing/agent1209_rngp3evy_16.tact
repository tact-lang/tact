struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    label: String;
}

contract OptionChain {
    val: OuterOpt;
    init() {
        self.val = OuterOpt{
            inner: null,
            label: "check"
        };
    }
}