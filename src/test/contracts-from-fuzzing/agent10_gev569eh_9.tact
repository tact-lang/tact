struct InnerOption {
    val: Int?;
}

struct OuterOption {
    o1: InnerOption;
    o2: InnerOption;
}

contract NestedOptionals {
    data: OuterOption;

    init() {
        self.data = OuterOption{
            o1: InnerOption{ val: null },
            o2: InnerOption{ val: 10 }
        };
    }
}