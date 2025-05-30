struct OptionalNest {
    inner: Int?;
    note: String?;
}

struct ContainerOpt {
    nested: OptionalNest?;
    val: Int;
}

contract OptionalMix {
    data: ContainerOpt;

    init() {
        self.data = ContainerOpt{
            nested: null,
            val: 555
        };
    }
}