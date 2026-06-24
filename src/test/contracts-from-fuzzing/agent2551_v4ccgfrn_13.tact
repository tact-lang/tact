struct InnerMost {
    val: Int;
    flag: Bool;
}

struct Middle {
    inner: InnerMost;
    txt: String;
}

struct Outer {
    mid: Middle;
}

contract ContractVeryDeep {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: InnerMost{val: 1, flag: true},
                txt: "deepdeep"
            }
        };
    }
}