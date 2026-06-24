contract DefaultAndNoDefault {
    val1: Int = 99;
    val2: Bool;
    str: String = "yo";

    init() {
        self.val2 = false;
    }
}