struct OptionalStr {
    s: String?;
}

contract SingleOptionalStr {
    data: OptionalStr = OptionalStr{ s: null };
    init() {
        self.data = OptionalStr{ s: "test" };
    }
}
