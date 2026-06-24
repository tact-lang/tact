struct ChildA {
    x: Int;
    y: Int;
}

struct ChildB {
    flag: Bool;
    str: String;
}

struct Parent {
    a: ChildA;
    b: ChildB;
    count: Int;
}

contract Combo {
    big: Parent;

    init() {
        self.big = Parent{
            a: ChildA{x:1, y:2},
            b: ChildB{flag:true, str:"hi"},
            count: 42
        };
    }
}