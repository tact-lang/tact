struct InnerMost {
    addr: Address?;
    flag: Bool;
}

struct Middle {
    inner: InnerMost;
    id: Int;
}

struct Outer {
    mid: Middle;
    txt: String;
}

contract TestContract {
    rec: Outer;

    init() {
        self.rec = Outer{
            mid: Middle{
                inner: InnerMost{ addr: null, flag: true },
                id: 77
            },
            txt: "deep"
        };
    }
}
