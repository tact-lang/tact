struct ManyOptionalStrings {
    a: String?;
    b: String?;
    c: String?;
    d: String?;
    e: String?;
    f: String?;
}

contract OptionalStringsStore {
    val: ManyOptionalStrings;

    init() {
        self.val = ManyOptionalStrings{
            a: null, b: null, c: null, d: null, e: null, f: null
        };
    }
}