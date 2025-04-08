struct InnerStrOpt {
    s: String?;
}

struct WrapStrOpt {
    n: InnerStrOpt?;
}

contract NestedOptContract {
    data: WrapStrOpt;

    init() {
        self.data = WrapStrOpt{n:null};
    }
}