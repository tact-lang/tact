struct ExtraNested {
    a: Int?;
    b: Bool?;
    s: String;
}

struct WrapNested {
    inner: ExtraNested;
}

contract TestExtraNested {
    val: WrapNested;

    init() {
        self.val = WrapNested{
            inner: ExtraNested{
                a: null,
                b: null,
                s: "ok"
            }
        };
    }
}