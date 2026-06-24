struct DeepOpt {
    s: String?;
    b: Bool?;
    i: Int?;
}

struct NestedOpt {
    inner: DeepOpt?;
}

contract TestContract {
    nestedOpt: NestedOpt;

    init() {
        self.nestedOpt = NestedOpt{ inner:null };
    }
}