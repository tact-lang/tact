struct NestedOpt {
    x: Int?;
    y: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt {
            x: null,
            y: InnerOpt{ flag: true },
        };
    }
}