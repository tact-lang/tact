struct S1 { x: Int; }
struct S2 { y: Bool; }

contract StructOrder {
    a: S1;
    b: Int;
    c: S2;
    d: Bool;

    init() {
        self.a = S1{x:1};
        self.b = 2;
        self.c = S2{y:true};
        self.d = false;
    }

    receive() {
        self.b += 1;
    }
}