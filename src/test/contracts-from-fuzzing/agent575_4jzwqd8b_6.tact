struct DeepOptional {
    label: String?;
    count: Int?;
    flag: Bool?;
}

contract TestContract {
    opt: DeepOptional;

    init() {
        self.opt = DeepOptional{ label: null, count: null, flag: true };
    }
}
