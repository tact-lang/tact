struct OptionalStr {
    label: String?;
}

contract OptionalStringContract {
    data: OptionalStr;

    init() {
        self.data = OptionalStr{label: null};
    }

    receive() {}
}