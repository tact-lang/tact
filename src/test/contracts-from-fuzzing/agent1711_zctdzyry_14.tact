struct SRec1 { x: Int; }
struct SRec2 { y: SRec1; z: Int; }

contract HasMultipleStructs {
    a: SRec1;
    b: SRec2;

    init() {
        self.a = SRec1{ x: 5 };
        self.b = SRec2{ y: SRec1{ x: 7 }, z: 9 };
    }
}