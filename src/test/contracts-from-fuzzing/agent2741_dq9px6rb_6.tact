struct InnerA { x: Int; y: Bool; }
struct InnerB { s: String; flag: Bool?; }

struct Middle {
    a: InnerA;
    b: InnerB;
}

contract ComboTypeTest {
    m: Middle;

    init() {
        self.m = Middle{
            a: InnerA{ x: 7, y: false },
            b: InnerB{ s: "hello", flag: null }
        };
    }
}