contract EdgeCase_Null_Assign {
    s: String? = null;

    init() {
        self.s = "hello";
        self.s = null;
    }
}