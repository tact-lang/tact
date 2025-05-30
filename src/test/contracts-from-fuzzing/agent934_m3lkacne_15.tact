contract ContractWithDefaults {
    x: Int = 5;
    y: String = "str";
    z: Bool = false;
    w: Int? = null;

    init() {
        self.x = 10;
        self.y = "newstr";
        self.z = true;
        self.w = null;
    }
}