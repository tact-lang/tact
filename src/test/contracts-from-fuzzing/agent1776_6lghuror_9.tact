struct OptionalNested {
    nest: Int?;
    name: String?;
}

contract TestContract {
    storage: OptionalNested;

    init() {
        self.storage = OptionalNested{
            nest: null,
            name: null
        };
    }

    receive() {
        let _ = self.storage.nest;
    }
}