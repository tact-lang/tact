struct S1 {
    x: Int;
    y: String;
}

struct S2 {
    f: S1;
    z: Bool;
}

contract MixDeep {
    s: S2;

    init() {
        self.s = S2{
            f: S1{ x:5, y:"hello" },
            z: false
        };
    }
}