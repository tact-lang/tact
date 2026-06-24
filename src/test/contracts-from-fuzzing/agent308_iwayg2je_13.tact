struct InnerOpt {
    foo: Int?;
}

struct OuterOpt {
    bar: InnerOpt?;
}

contract Test {
    data: OuterOpt?;

    init() {
        self.data = null;
    }
}