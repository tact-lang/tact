struct NestedText {
    s1: String;
    s2: String;
}

struct Outer {
    n1: NestedText;
    n2: NestedText;
}

contract TestContract {
    textGroup: Outer;

    init() {
        self.textGroup = Outer{
            n1: NestedText{s1:"One", s2:"Two"},
            n2: NestedText{s1:"Three", s2:"Four"},
        };
    }
}