contract RecursiveDefault {
    val: Int = 123;

    init() {
        self.val = self.val + 1;
    }
}