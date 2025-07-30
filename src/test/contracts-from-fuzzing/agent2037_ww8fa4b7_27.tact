// optional subtype struct with many optionals
struct OptionalMany {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract OptionStructInside {
    val: OptionalMany;

    init() {
        self.val = OptionalMany{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}
