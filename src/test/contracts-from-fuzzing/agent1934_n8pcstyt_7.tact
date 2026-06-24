struct Defaults {
    a: Int = 5;
    b: Bool = true;
    c: Int?;
    d: Bool? = false;
}

contract DefaultValues {
    s: Defaults;

    init() {
        self.s = Defaults{
            c: null,
        };
    }
}
