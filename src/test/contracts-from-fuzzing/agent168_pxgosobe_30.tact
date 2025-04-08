struct DeepOpt {
    x: Int?;
    y: String?;
    z: Address?;
}

contract ManyOpts {
    d: DeepOpt?;

    init() {
        self.d = null;
    }
}
