// deep nested repeated same-type structs inside persistent contract var
struct RecB {
    x: Int = 5;
    flag: Bool = false;
}

struct RecA {
    one: RecB;
    two: RecB;
}

struct Top {
    r1: RecA;
    r2: RecA;
}

contract Repeater {
    a: Top;
    init() {
        self.a = Top{
            r1: RecA{one: RecB{x:1,flag:true}, two: RecB{x:2,flag:false}},
            r2: RecA{one: RecB{x:3,flag:false}, two: RecB{x:4,flag:true}},
        };
    }
}
