struct OptionalOut {
    inner: Int?;
}

contract DefaultOptional {
    val: OptionalOut;

    init() {
        self.val = OptionalOut{ inner: null };
    }
}