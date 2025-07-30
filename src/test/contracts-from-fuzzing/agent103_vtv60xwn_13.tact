struct A { a: Int }
struct B { b: Int }
struct C { c: Int }

contract Layers {
    a: A;
    b: B;
    c: C;
    i: Int = 4;
    opt: Int?;

    init() {
        self.a = A{a:1};
        self.b = B{b:2};
        self.c = C{c:3};
        self.i = 10;
        self.opt = null;
    }
}