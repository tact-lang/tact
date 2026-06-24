struct ComboDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hello";
    d: String? = "opt";
    e: Bool? = null;
}

contract TestContract {
    f: ComboDefaults;

    init() {
        self.f = ComboDefaults{ b: true };
    }
}