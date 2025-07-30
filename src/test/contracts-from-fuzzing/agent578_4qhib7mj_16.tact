contract InitOrder {
    val: Int;
    valOpt: Int?;
    flag: Bool = false;
    txt: String;

    init() {
        self.val = 55;
        self.valOpt = null;
        self.txt = "yo";
    }
}