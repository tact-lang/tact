struct Rec {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
}

contract AlternatingOptional {
    f: Rec;

    init() {
        self.f = Rec{
            a:1, b:null, c:2, d:3
        };
    }
}