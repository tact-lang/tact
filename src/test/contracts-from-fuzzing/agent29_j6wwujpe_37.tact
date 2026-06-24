struct NestedIsOptional {
    nestedOpt: InnerOptional?;
}

struct InnerOptional {
    flag: Bool;
}

contract NestedOptFieldContract {
    val: NestedIsOptional;

    init() {
        self.val = NestedIsOptional{
            nestedOpt:null
        };
    }
}