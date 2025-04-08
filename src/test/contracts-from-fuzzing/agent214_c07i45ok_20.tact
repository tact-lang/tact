struct OptionalNested {
    id: Int;
    name: String?;
}

contract TestContract {
    on: OptionalNested?;

    init() {
        self.on = null;
    }
}