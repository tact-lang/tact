struct InnerS {
    a: Int;
    b: Bool;
}

struct OuterS {
    inner: InnerS;
    label: String;
}

contract AssignedNested {
    outer: OuterS;

    init() {
        let tmp = InnerS{a: 9, b: false};
        self.outer = OuterS{ inner: tmp, label: "lbl" };
    }
}