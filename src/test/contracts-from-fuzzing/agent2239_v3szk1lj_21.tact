contract DefaultsAndOptionals {
    f1: Int = 5;
    f2: Bool?;
    f3: String = "str";

    init() {
        self.f2 = null;
    }
}