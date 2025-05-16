struct InnerNested {
    f: Int;
}

struct MiddleNested {
    inn: InnerNested;
}

contract InitNestedChain {
    data: MiddleNested;

    init() {
        self.data = MiddleNested{
            inn: InnerNested{
                f: 100
            }
        };
    }
}