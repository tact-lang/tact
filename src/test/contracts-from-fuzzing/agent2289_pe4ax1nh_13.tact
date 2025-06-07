struct Rec1 {
    a: Int;
}

struct Rec2 {
    b: Rec1;
    c: Int?;
    flag: Bool;
}

contract MultiStructs {
    x: Rec1;
    y: Rec2;
    z: Rec2;

    init() {
        self.x = Rec1{ a: 1 };
        self.y = Rec2{ b: self.x, c: null, flag: true };
        self.z = Rec2{ b: self.x, c: 42, flag: false };
    }
}