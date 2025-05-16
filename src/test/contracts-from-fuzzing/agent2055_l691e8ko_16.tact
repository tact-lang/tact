struct StrA { x: Int; y: String; }
struct StrB { z: Bool; }

contract MixedOptionals {
    a: StrA?;
    b: StrB;
    c: Int?;
    d: Bool?;

    init() {
        self.a = null;
        self.b = StrB{z:true};
        self.c = 42;
        self.d = false;
    }
}
