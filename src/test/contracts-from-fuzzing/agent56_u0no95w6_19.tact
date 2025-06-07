struct Inner {
    x: Int?;
    y: String = "hello";
}

contract ContractWithDefaultOptional {
    data: Inner;

    init() {
        self.data = Inner{};
    }
}