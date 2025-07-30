struct SOne {
    p: Int;
}

struct STwo {
    p: Int;
}

contract DiffStructs {
    one: SOne;
    two: STwo;

    init() {
        self.one = SOne{p:1};
        self.two = STwo{p:2};
    }
}