struct OptionalStr {
    s: String?;
}

contract StructOptStr {
    data: OptionalStr;

    init() {
        self.data = OptionalStr{ s: null };
    }
}