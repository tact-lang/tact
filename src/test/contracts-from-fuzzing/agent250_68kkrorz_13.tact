contract DefaultsVsInit {
    val1: Int = 1;
    val2: Bool = true;
    val3: String = "init";

    init() {
        self.val1 = 42;
        self.val2 = false;
        self.val3 = "changed";
    }
}