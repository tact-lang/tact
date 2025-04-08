struct RecOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: InnerRec?;
}

struct InnerRec {
    f: Int?;
    g: Bool?;
}

contract TestContract {
    s: RecOptional;

    init() {
        self.s = RecOptional{
            a: 1,
            b: "test",
            c: true,
            d: InnerRec{f: 2, g: false}
        };
    }
}