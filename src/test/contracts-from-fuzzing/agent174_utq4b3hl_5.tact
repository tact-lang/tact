struct DeepOpt {
    val: Int?;
    txt: String?;
    flag: Bool?;
}

contract DeepOptionals {
    inner: DeepOpt;

    init() {
        self.inner = DeepOpt{
            val: null,
            txt: null,
            flag: null
        };
    }
}