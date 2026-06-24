contract DefaultsAndOverrides {
    val1: Int = 1;
    val2: Int = 5;

    init() {
        self.val2 = 10;
    }
}