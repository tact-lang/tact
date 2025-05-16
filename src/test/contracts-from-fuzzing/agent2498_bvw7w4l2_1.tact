struct DeepOptional {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract TestContract {
    dopt: DeepOptional;

    init() {
        self.dopt = DeepOptional{
            x: null,
            y: null,
            z: true,
        };
    }
}