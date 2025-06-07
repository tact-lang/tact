struct SOptInts {
    a: Int?;
    b: Int?;
}

struct NestedOpt {
    opt: SOptInts?;
}

contract AssignedNestedOpt {
    val: NestedOpt;

    init() {
        self.val = NestedOpt{ opt: SOptInts{ a: null, b: 2 } };
    }
}
