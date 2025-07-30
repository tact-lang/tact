struct Inner {
    status: Bool?;
    note: String;
    value: Int?;
}

contract ContractOpt {
    inner: Inner;

    init() {
        self.inner = Inner{
            status: true,
            note: "hello",
            value: null
        };
    }
}