contract OnlyOptional {
    item1: Int? = null;
    item2: String? = null;
    item3: Bool? = null;

    init() {
        self.item1 = 88;
        self.item2 = "set";
        self.item3 = true;
    }
}