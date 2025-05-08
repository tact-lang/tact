contract WithConstantsAndFields {
    const A: Int = 10;
    const B: Bool = true;

    x: Int;
    y: Bool;

    init() {
        self.x = self.A + 5;
        self.y = self.B;
    }
}