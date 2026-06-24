struct OptionalStr { s: String? }

contract TestOptionalStr {
    optS: OptionalStr?;

    init() {
        self.optS = OptionalStr{ s: null };
    }
}