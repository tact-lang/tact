contract OptionDefaults {
    a: Int?;
    b: Bool?;

    init() {
        self.a = null;
        self.b = null;
    }

    get fun show(): Int {
        if (self.a == null) {
            return 0;
        }
        return self.a!!;
    }
}