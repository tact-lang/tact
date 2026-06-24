struct InnerMost {
    a: Int;
}

struct MidOpt {
    innerMost: InnerMost?;
    label: String;
}

struct OuterOpt {
    mid: MidOpt?;
    note: String;
}

contract OptionalNestedStructs {
    data: OuterOpt?;

    init() {
        self.data = OuterOpt{ mid: null, note: "hi" };
    }
}
