struct Rec1 {
    f1: Int;
    f2: Int?;
}

struct Rec2 {
    embedded: Rec1;
    flag: Bool;
}

contract TestContract {
    pair: Rec2;

    init() {
        self.pair = Rec2{
            embedded: Rec1{ f1: 50, f2: null },
            flag: true
        };
    }
}