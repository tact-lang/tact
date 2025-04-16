struct Duo {
    a: Int;
    b: Bool;
}

struct NestedOpt {
    pair: Duo?;
    flag: Bool;
}

contract Test {
    s: NestedOpt;

    init() {
        self.s = NestedOpt{
            pair: null,
            flag: false
        };
    }
}