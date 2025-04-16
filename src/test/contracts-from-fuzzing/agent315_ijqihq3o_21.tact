struct X1 { a: Int; }
struct X2 { a: Int; }
struct X3 { a: Int; }
struct X4 { a: Int; }
struct X5 { a: Int; }
struct X6 { a: Int; }
struct Bundle {
    x1: X1;
    x2: X2;
    x3: X3;
    x4: X4;
    x5: X5;
    x6: X6;
}
contract BigBundle {
    b: Bundle;
    init() {
        self.b = Bundle{
            x1: X1{a:1},
            x2: X2{a:2},
            x3: X3{a:3},
            x4: X4{a:4},
            x5: X5{a:5},
            x6: X6{a:6},
        };
    }
}