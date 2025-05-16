struct InnerOpt {
    s: String?;
}

struct OuterOpt {
    i: Int?;
    inner: InnerOpt?;
}

contract OptCombo {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            i: null,
            inner: null
        };
    }
}