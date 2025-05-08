struct MultipleOptionStructs {
    s1: InnerOpt;
    s2: InnerOpt;
}

struct InnerOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract MultiOptContract {
    data: MultipleOptionStructs;

    init() {
        self.data = MultipleOptionStructs{
            s1: InnerOpt{ a: null, b: null, c: null },
            s2: InnerOpt{ a: 5, b: true, c: "x" }
        };
    }
}
