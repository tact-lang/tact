contract FieldDefaults {
    ai: Int = 5;
    ab: Bool = false;
    as_: String = "hello";
    ao: Int? = null;

    init() {
        self.ai = 10;
        self.ab = true;
        self.as_ = "world";
        self.ao = null;
    }
}
