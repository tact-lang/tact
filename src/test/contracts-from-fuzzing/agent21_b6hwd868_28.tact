struct Rec {
    s: Int;
    o: Int?;
}

contract InitDefaults {
    x: Int = 5;
    y: Int?;
    rec: Rec;

    init() {
        self.y = null;
        self.rec = Rec{ s: 10, o: null };
    }
}