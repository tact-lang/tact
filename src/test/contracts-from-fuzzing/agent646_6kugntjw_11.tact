contract MultiOptionals {
    op1: Int?;
    op2: String?;
    op3: Bool?;
    op4: Cell?;
    op5: Address?;

    init() {
        self.op1 = null;
        self.op2 = null;
        self.op3 = null;
        self.op4 = null;
        self.op5 = null;
    }
}