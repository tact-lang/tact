struct InnerMost {
    a: Int; 
}

struct MidOpt {
    i: InnerMost?;
    b: Bool;
}

contract OptionalStructField {
    f: MidOpt;

    init() {
        self.f = MidOpt{
            i: null,
            b: false
        };
    }
}