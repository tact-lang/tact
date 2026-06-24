struct Defaults {
    a: Int?;           // null by default
    b: Bool?;          // null by default
    c: String?;        // null by default
    d: Address?;       // null by default
}

contract TestContract {
    defs: Defaults;

    init() {
        self.defs = Defaults{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}