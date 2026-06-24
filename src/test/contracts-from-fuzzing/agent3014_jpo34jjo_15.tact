struct DefaultsAndOpts {
    a: Int = 5;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String = "X";
    f: String?;
}

contract TestContract {
    s: DefaultsAndOpts;

    init() {
        self.s = DefaultsAndOpts{
            b: null,
            d: null,
            f: null,
        };
    }
}