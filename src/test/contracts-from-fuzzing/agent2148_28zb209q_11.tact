struct PT1 { x:Int; y:Int; }
struct PT2 { pt1: PT1; }
struct PT3 { pt2: PT2; }

contract ManyNested {
    v: PT3;
    init() {
        self.v = PT3{ pt2: PT2{ pt1: PT1{ x:1, y:2 } } };
    }
}