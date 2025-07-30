struct OptionalInsideOptional {
    info: String?;
}

contract OptionalFieldDirect {
    data: OptionalInsideOptional?;

    init() {
        self.data = null;
    }

    receive() {
        let _ = self.data;
    }
}