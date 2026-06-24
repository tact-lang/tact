struct Defaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
}

contract DefaultsContract {
    def: Defaults;

    init() {
        self.def = Defaults{}; // use all field defaults
    }
}
