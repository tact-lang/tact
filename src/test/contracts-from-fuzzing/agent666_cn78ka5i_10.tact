struct Defaults {
    a: Int = 1;
    b: String = "hello";
    c: Bool = false;
}

contract DefFields {
    df: Defaults;

    init() {
        self.df = Defaults{};
    }
}
