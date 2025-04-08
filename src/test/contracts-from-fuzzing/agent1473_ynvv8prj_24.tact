struct NestedOpt {
    a: Int?;
    nest: OptStruct?;
}

struct OptStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    n: NestedOpt;

    init() {
        self.n = NestedOpt{ a:null, nest:null };
    }
}