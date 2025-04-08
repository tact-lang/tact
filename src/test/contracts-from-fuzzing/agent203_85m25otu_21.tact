struct DeepOpt {
    val: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    flag: Bool?;
    innerMost: SubOpt?;
}

struct SubOpt {
    n: Int?;
}

contract TestContract {
    storage: DeepOpt;

    init() {
        self.storage = DeepOpt{
            val: null,
            inner: InnerOpt{
                flag: null,
                innerMost: SubOpt{
                    n: null,
                },
            },
        };
    }
}