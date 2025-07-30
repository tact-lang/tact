contract OptionalFieldDefaults {
    f1: Int? = 7;
    f2: String? = null;
    f3: Bool? = true;

    init() {
        self.f1 = null;
        self.f2 = "done";
        self.f3 = false;
    }
}