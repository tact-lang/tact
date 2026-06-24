struct DefsAndOpts {
    a: Int = 1;
    b: Bool = false;
    c: Int?; // defaults implicitly to null
    d: Bool?; // defaults implicitly to null
}

contract DefaultsOmitted {
    dat: DefsAndOpts;

    init() {
        self.dat = DefsAndOpts{};
    }
}