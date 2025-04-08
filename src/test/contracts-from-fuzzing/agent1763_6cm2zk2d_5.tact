struct OptionalStr {
    text: String?;
}

contract TestContract {
    data: OptionalStr;

    init() {
        self.data = OptionalStr{text: null};
    }
}