struct InnerStr {
    s: String;
}

struct OuterCont {
    i: InnerStr;
    j: InnerStr;
}

contract NestedStrings {
    cont: OuterCont;

    init() {
        self.cont = OuterCont{
            i: InnerStr{s: "foo"},
            j: InnerStr{s: "bar"}
        };
    }
}