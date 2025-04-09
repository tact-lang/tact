struct InnerA {
    x: Int;
    y: Bool;
}

struct InnerB {
    s: String;
    flag: Bool;
}

struct Middle {
    innerA: InnerA;
    innerB: InnerB;
    text: String;
}

contract DeepNesting {
    mid: Middle;
    init() {
        self.mid = Middle{
            innerA: InnerA{ x:1, y:true },
            innerB: InnerB{ s:"hi", flag:false },
            text: "nested"
        };
    }
}