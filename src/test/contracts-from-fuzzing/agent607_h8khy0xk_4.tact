struct OptionalExample {
    a: Int?;
    b: Bool?;
}

contract OptionalStruct {
    value: OptionalExample;

    init() {
        self.value = OptionalExample{ a: null, b: true };
    }
}