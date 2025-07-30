struct Rec {
    x: Int;
    y: Rec2;
}

struct Rec2 {
    z: Int;
}

contract DeepRec {
    data: Rec;

    init() {
        self.data = Rec{
            x:5,
            y: Rec2{ z:10 }
        };
    }
}