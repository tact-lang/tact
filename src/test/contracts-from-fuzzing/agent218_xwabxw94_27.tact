struct DeepOpt {
    foo: Int?;
    bar: Bool?;
}

contract DeepOptImplicit {
    val: DeepOpt;

    init() {
        self.val = DeepOpt{};
    }
}