struct OptionalOuter {
    inner: Int?;
}

contract OptionalDefault {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{ inner: null };
    }
}
