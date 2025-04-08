contract OptionDefaults {
    o1: Int? = null;
    o2: Bool? = null;
    o3: String? = null;

    init() {
        self.o1 = 100;
        self.o2 = true;
        self.o3 = "sup";
    }
}