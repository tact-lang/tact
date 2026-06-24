struct OptionalFields {
    x: Int?;
    s: String?;
    b: Bool?;
}

contract TestContract {
    opt: OptionalFields;

    init() {
        self.opt = OptionalFields{
            x: null,
            s: "hello",
            b: null,
        };
    }
}
