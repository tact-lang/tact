struct Defaults {
    i: Int = 5;
    b: Bool = true;
    s: String = "test";
}

contract DefaultsContract {
    df: Defaults;

    init() {
        self.df = Defaults{};
    }
}