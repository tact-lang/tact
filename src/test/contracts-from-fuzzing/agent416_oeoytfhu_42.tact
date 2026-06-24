struct OptionalWrapper {
    inner: Bool?;
}

contract Test42 {
    val: OptionalWrapper;

    init() {
        self.val = OptionalWrapper{ inner: null };
    }
}
