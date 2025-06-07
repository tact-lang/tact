struct OptionalContainer {
    inner: Int?;
}

contract OptionalInit {
    data: OptionalContainer;
    init() {
        self.data = OptionalContainer{ inner: null };
    }
}