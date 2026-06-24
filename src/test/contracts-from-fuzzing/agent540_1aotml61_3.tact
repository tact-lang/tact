struct OptionalStruct {
    a: Int?;
    b: Bool?;
}

contract OptStructContract {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{ a: null, b: true };
    }
}