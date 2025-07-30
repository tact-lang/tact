struct OptionalWithDefault {
    a: Int?;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    data: OptionalWithDefault;

    init() {
        self.data = OptionalWithDefault{
            a: null
        };
    }
}