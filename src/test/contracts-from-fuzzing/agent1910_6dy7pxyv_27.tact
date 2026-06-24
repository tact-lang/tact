struct DeepOptional {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct ContainerOpt {
    inner: DeepOptional?;
}

contract OptionalStructField {
    val: ContainerOpt;

    init() {
        self.val = ContainerOpt{
            inner: null
        };
    }
}
