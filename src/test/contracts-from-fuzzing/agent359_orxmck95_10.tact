struct VeryInner {
    value: Int?;
}

struct InnerOpt {
    inner: VeryInner?;
    label: String?;
}

struct Nesting {
    sub: InnerOpt?;
}

contract TestContract {
    deep: Nesting;

    init() {
        self.deep = Nesting{ sub: InnerOpt{ inner: null, label: null } };
    }
}