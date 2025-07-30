struct X1 { a:Int; }
struct X2 { b:Int; }
struct X3 { c:Int; }
struct X4 { d:Int; }

struct S {
    x1: X1;
    x2: X2;
    x3: X3;
    x4: X4;
    val: Int;
}

contract TestContract {
    s: S;
    init() {
        self.s = S{
            x1:X1{a:1},
            x2:X2{b:2},
            x3:X3{c:3},
            x4:X4{d:4},
            val:5
        };
    }
}