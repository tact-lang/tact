struct Wrapped {
    data: InnerWrap;
}

struct InnerWrap {
    flag: Bool;
    text: String;
}

contract WrappedComplex {
    w: Wrapped;
    extra: String;

    init() {
        self.w = Wrapped{ data: InnerWrap{ flag: true, text: "hey" } };
        self.extra = "more";
    }
}