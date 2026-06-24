struct Rec1 {
    b: Bool;
}

contract OptRecNullable {
    rec: Rec1?;

    init() {
        self.rec = null;
    }
}