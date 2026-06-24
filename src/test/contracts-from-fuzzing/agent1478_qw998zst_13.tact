struct InnerOptional {
    x: Int?;
    y: Int;
}

struct ContainsInnerOpt {
    i: InnerOptional?;
}

contract TestContract {
    field: ContainsInnerOpt;

    init() {
        self.field = ContainsInnerOpt{ i: null };
    }
}
