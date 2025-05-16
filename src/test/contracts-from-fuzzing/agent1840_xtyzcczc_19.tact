struct InsaneDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "def";
}

contract DefSet {
    data: InsaneDefaults;

    init() {
        self.data = InsaneDefaults{};
    }
}