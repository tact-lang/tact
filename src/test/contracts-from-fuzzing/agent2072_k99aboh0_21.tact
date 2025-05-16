struct OptionalWrap {
    inner: Int?;
}

contract OptionalNoInit {
    data: OptionalWrap;

    init() {
        self.data = OptionalWrap{ inner: null };
    }
}