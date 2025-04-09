struct InnerOpt {
    b: Bool?;
}

struct OuterOpt {
    s: String;
    inner: InnerOpt?;
}

contract OptionalFieldNested {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{ s: "hey", inner: null };
    }
}