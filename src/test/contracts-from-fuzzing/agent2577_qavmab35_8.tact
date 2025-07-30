struct OptionalString {
    s: String?;
    b: Bool;
}

contract OptStringContract {
    opt: OptionalString;

    init() {
        self.opt = OptionalString{
            s: null,
            b: false,
        };
    }
}
