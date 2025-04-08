contract BigPrimitives {
    val1: Int = 0xFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
    val2: Int = -1;

    init() {
        self.val1 = 42;
        self.val2 = -42;
    }
}