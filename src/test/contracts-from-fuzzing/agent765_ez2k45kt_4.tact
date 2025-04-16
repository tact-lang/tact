struct DeepOptional {
    inner: Int?;
    other: Int;
}

contract TestContract {
    state: DeepOptional?;

    init() {
        self.state = DeepOptional{ inner: 17, other: 34 };
    }
}