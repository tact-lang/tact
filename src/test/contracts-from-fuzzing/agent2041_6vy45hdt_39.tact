struct DeepOpt {
    a: Int?;
    b: String?;
}

contract HoldDeepOpt {
    data: DeepOpt;
    init() {
        self.data = DeepOpt{
            a: null,
            b: null
        };
    }
}