struct OptionalData {
    a: Int? = null;
    b: Int? = 99;
    c: Bool? = false;
}

contract OptDefaults {
    data: OptionalData?;

    init() {
        self.data = OptionalData{
            a: 42,
            b: null,
            c: true,
        };
    }
}