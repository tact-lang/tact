contract LazyInitVsFields {
    val1: Int;
    val2: Int = 2;
    val3: String;

    init() {
        self.val1 = 1;
        self.val3 = "hello";
    }
}