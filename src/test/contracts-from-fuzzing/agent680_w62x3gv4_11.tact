contract EmptyDefaultOptionalTest {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
    opt5: Cell?;
    opt6: Slice?;

    init() {
        self.opt1 = 5;
        self.opt2 = false;
        self.opt3 = "hi";
        self.opt4 = myAddress();
        self.opt5 = emptyCell();
        self.opt6 = emptyCell().asSlice();
    }

    receive() {
        let _ = self.opt1 != null ? self.opt1!! : 0;
    }
}