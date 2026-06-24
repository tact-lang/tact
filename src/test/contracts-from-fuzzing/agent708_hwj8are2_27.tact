struct OptionalStr {
    val: String?;
}

contract OptionalStringDefault {
    data: OptionalStr;

    init() {
        self.data = OptionalStr{ val: null };
    }
}