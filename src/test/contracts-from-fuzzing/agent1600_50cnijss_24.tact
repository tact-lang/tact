struct OptionalStr {
    name: String?;
    id: Int;
}

contract TestContract {
    data: OptionalStr;

    init() {
        self.data = OptionalStr{
            name: null,
            id: 42
        };
    }
}