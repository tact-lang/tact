struct DeepOptional {
    val1: Int?;
    val2: String?;
    val3: Bool?;
}

struct ContainerOpt {
    inner: DeepOptional?;
    another: Int;
}

contract OptionalLayer {
    v: ContainerOpt;

    init() {
        self.v = ContainerOpt {
            inner: null,
            another: 100
        };
    }
}