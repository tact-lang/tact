struct A1 { x:Int; }
struct A2 { y:A1; }
struct A3 { z:A2; }
struct A4 { w:A3; }
struct A5 { v:A4; }

contract Chain5 {
    f: A5;
    init() {
        self.f = A5{ v: A4{ w: A3{ z: A2{ y:A1{ x:88 } } } } };
    }
}