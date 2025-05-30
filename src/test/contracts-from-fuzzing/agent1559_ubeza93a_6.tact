contract MixOptionals {
    v1: Int?;
    v2: Bool;
    v3: String?;
    v4: Cell;

    init() {
        self.v1 = null;
        self.v2 = true;
        self.v3 = null;
        self.v4 = emptyCell();
    }
}