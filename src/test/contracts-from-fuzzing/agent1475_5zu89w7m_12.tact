struct OptionalStrBool {
    s: String?;
    b: Bool?;
}

contract PersistsOptInside {
    container: OptionalStrBool;

    init() {
        self.container = OptionalStrBool {
            s: "pop",
            b: false,
        };
    }
}