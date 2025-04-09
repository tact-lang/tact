// Struct with optional string fields
struct OptionalStrings {
    a: String?;
    b: String?;
    c: String?;
}

contract TestContract {
    optStrings: OptionalStrings;

    init() {
        self.optStrings = OptionalStrings{
            a: null,
            b: "bbb",
            c: null,
        };
    }
}
