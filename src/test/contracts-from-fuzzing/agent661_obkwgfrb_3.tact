struct InnerOpt {
    flag: Bool?;
    num: Int?;
}

contract OptionalNested {
    inner: InnerOpt;

    init() {
        self.inner = InnerOpt{
            flag: true,
            num: null
        };
    }
}