struct InnerA {
    a: Int;
    flag: Bool;
}

struct InnerB {
    b: String;
    innerA: InnerA;
}

contract MixedTypes {
    x: Int;
    s: String;
    i: InnerB;
    opt: Bool?;

    init() {
        self.x = 5;
        self.s = "hello";
        self.i = InnerB{
            b: "world",
            innerA: InnerA{ a: 10, flag: false }
        };
        self.opt = null;
    }
}
