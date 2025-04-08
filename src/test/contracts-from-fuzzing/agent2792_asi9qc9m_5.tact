struct DeepOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
    flag: Bool;
}

contract NestedOptionals {
    state: DeepOpt;

    init() {
        self.state = DeepOpt{
            inner: InnerOpt{
                val: null,
                flag: false
            }
        };
    }
}