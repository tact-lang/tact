struct NestedOptionals {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract NestedOptContract {
    state: NestedOptionals;
    init() {
        self.state = NestedOptionals {
            inner: InnerOpt {
                val: null
            }
        };
    }
}