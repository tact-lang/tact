struct NestedOpt {
    inner: Int?;
}

struct Top {
    nestedOpt: NestedOpt?;
    someVal: Bool;
}

contract NestedOptContract {
    data: Top;

    init() {
        self.data = Top{
            nestedOpt: null,
            someVal: true
        };
    }
}