struct Defaults {
    a: Int = 7;
    b: Bool = true;
    s: String = "hello";
    opt: Int?;
}

contract StructDefaults {
    d: Defaults;

    init() {
        self.d = Defaults{
            opt: null,
        };
    }
}
