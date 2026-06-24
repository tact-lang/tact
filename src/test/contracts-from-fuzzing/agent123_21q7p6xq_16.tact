struct DefaultsAndOpts {
    a: Int = 10;
    b: Int?;
    c: Bool = true;
    d: Bool?;
    e: String = "hi";
    f: String?;
}

contract TestContract {
    dat: DefaultsAndOpts;

    init() {
        self.dat = DefaultsAndOpts{
            a: 100,
            b: 200,
            c: false,
            d: null,
            e: "override",
            f: "text"
        };
    }
}