struct NestedStrings {
    foo: InnerS;
    bar: InnerS;
}

struct InnerS {
    s1: String;
    s2: String?;
}

contract TestNestedStrings {
    s: NestedStrings;

    init() {
        self.s = NestedStrings{
            foo: InnerS{s1:"hi", s2:null},
            bar: InnerS{s1:"bye", s2:null}
        };
    }
}