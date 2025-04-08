contract MultiPersistentOpts {
    ai: Int?;
    ab: Bool? = false;
    ac: Cell?;

    init() {
        self.ai = null;
        self.ac = emptyCell();
    }
}