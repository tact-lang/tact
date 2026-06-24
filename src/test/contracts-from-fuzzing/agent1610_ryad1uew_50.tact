struct Rec {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract PartialNullDefaults {
    f: Rec;

    init() {
        self.f = Rec{
            a: 1,
            b: null,
            c: 3
        };
    }
}