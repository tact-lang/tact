struct OptionalStr {
    name: String?;
    info: String?;
}

contract OptString {
    data: OptionalStr;

    init() {
        self.data = OptionalStr{
            name: null,
            info: null
        };
    }
}