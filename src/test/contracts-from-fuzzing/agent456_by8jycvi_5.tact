struct NestedOptionals {
    innerOpt: Inner?;
}

struct Inner {
    data: Int?;
}

contract NestedOptionalsContract {
    storage: NestedOptionals;

    init() {
        self.storage = NestedOptionals {
            innerOpt: Inner {
                data: null
            }
        };
    }
}