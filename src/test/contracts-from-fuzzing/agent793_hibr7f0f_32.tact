contract DefaultSerialize {
    val: Int as coins;
    init() {
        self.val = ton("1");
    }
}