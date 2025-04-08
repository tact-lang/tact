struct Rec {
    a: Int;
    b: Int?
}

contract DefaultNullOptional {
    rec: Rec;

    init() {
        self.rec = Rec{ a: 1 };
    }
}