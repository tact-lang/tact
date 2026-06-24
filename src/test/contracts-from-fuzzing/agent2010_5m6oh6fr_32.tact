struct S { x: Int; y: Bool; }

contract ArrayOfStructs {
    f1: S;
    f2: S;
    f3: S;
    f4: S;

    init() {
        self.f1 = S{ x:1, y:true };
        self.f2 = S{ x:2, y:false };
        self.f3 = S{ x:3, y:true };
        self.f4 = S{ x:4, y:false };
    }
}