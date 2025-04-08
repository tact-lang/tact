struct DeepOptional {
    nested: Bool?;
}
struct Wrapper {
    inner: DeepOptional?;
}

contract OptionalWrap {
    val: Wrapper;

    init() {
        self.val = Wrapper{};
    }
}