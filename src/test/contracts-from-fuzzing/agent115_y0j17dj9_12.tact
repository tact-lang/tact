struct InnerOpt {
    d: String?;
}

struct OuterOpt {
    e: Int;
    f: InnerOpt;
}

contract OptionalInStructs {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            e: 5,
            f: InnerOpt{d: null}
        };
    }
}