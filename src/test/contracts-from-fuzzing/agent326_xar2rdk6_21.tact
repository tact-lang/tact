struct OptionalContainer {
    value: Int?;
}

contract NullablePersistent {
    data: OptionalContainer?;

    init() {
        self.data = null;
    }

    receive() {
        self.data = self.data;
    }
}