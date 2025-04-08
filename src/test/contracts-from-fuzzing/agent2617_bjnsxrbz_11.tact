struct InnerMost {
    v: Int;
}

struct InnerOpt {
    inn: InnerMost?;
}

struct MidOpt {
    i: InnerOpt?;
    label: String;
}

contract OptStructInStruct {
    data: MidOpt;
    init() {
        self.data = MidOpt{
            i: null,
            label: "hi"
        };
    }
}