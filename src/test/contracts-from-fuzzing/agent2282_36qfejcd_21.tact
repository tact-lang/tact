struct WithStringsAndInts {
    s1: String;
    s2: String;
    n1: Int;
    n2: Int;
}

contract Test20 {
    s: WithStringsAndInts;

    init() {
        self.s = WithStringsAndInts{
            s1: "foo",
            s2: "bar",
            n1: 1,
            n2: 2
        };
    }
}