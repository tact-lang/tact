struct Tiny {
    x: Int;
}

contract ManyTinyNested {
    t1: Tiny = Tiny{ x:1 };
    t2: Tiny = Tiny{ x:2 };
    t3: Tiny = Tiny{ x:3 };

    init() {}
}