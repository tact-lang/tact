struct OptionalStrings {
    a: String?;
    b: String?;
    c: String?;
}

contract OptStrs {
    val: OptionalStrings;

    init() {
        self.val = OptionalStrings{
            a: "",
            b: null,
            c: "x"
        };
    }
}