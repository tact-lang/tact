contract MultiAssign {
    tiny: Int as uint4;

    init() {
        self.tiny = 999;
        self.tiny = 5;
    }
}