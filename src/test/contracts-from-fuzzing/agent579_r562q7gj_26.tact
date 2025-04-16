struct Defaults {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract ImplicitNulls {
    d: Defaults;

    init() {
        self.d = Defaults{
            a: null,
            b: null,
            s: null
        };
    }
}