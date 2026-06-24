struct OptionalInOptional {
    inner: Int?;
}

contract OptionalOptionalStorage {
    val: OptionalInOptional?;
    init() {
        self.val = OptionalInOptional{ inner: null };
    }
}