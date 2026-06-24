struct NestedStringsOpt {
    s1: String;
    s2: String?;
}

struct Container {
    n1: NestedStringsOpt;
    n2: NestedStringsOpt;
}

contract NestedStringsContractTest {
    data: Container;

    init() {
        self.data = Container{
            n1: NestedStringsOpt{s1:"hi", s2: null},
            n2: NestedStringsOpt{s1:"yo", s2: "zz"}
        };
    }
}