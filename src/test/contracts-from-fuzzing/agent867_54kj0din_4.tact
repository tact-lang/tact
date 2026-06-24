struct OptionalContainer {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    opt: OptionalContainer = OptionalContainer{ a: null, b: null, c: null };

    init() {
        self.opt = OptionalContainer{ a: 7, b: true, c: "not null" };
    }
}
