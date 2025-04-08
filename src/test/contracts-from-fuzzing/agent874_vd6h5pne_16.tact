struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    nestedOpt: DeepOpt?;

    init() {
        self.nestedOpt = DeepOpt{
            a: null,
            b: true,
            c: null,
        };
    }
}
