struct DeepOpt {
    inner: InnerOpt?;
    flag: Bool;
}

struct InnerOpt {
    val: Int?;
}

contract DeepOptionalStruct {
    data: DeepOpt;

    init() {
        self.data = DeepOpt{
            inner: InnerOpt{
                val: 99
            },
            flag: false
        };
    }
}