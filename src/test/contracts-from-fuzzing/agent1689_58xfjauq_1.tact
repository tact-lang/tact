struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: InnerOpt?;
}

struct InnerOpt {
    d: Int?;
    e: Bool?;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            a: 1,
            b: true,
            c: InnerOpt{ d: 5, e: false }
        };
    }
}