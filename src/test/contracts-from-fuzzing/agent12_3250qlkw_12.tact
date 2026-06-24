contract DefaultsVersusInit {
    val1: Int = 0;
    val2: Bool;
    val3: String = "default";

    init() {
        self.val2 = true;
        self.val3 = "override";
    }
}