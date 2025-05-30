contract OptionalStringCell {
    txt: String?;
    dat: Cell?;

    init() {
        self.txt = null;
        self.dat = emptyCell();
    }
}