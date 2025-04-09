struct WrapperOptStruct {
    inner: Int?;
}

contract OptionalStructNull {
    w: WrapperOptStruct?;
    init() {
        self.w = null;
    }
}