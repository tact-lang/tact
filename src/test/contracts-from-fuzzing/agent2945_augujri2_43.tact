struct Base1 {
    x: Int;
}
struct Base2 {
    y: Int;
}

struct Both {
    a: Base1;
    b: Base2;
}

contract Comp {
    v: Both;

    init() {
        self.v = Both{a: Base1{x:1}, b: Base2{y:2}};
    }
}