struct DeepOpt {
    x: Int;
    y: Bool;
}

contract OptionalTupleWrapper {
    val: DeepOpt?;

    init() {
        self.val = DeepOpt{
            x: 42,
            y: true,
        };
    }
}