contract ListsOfFields {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
    opt5: Slice?;

    init() {
    self.x1 = 1; self.x2 = 2; self.x3 = 3; self.x4 = 4; self.x5 = 5;
    self.opt1 = null; self.opt2 = null; self.opt3 = null;
    self.opt4 = null; self.opt5 = null;
    }
}