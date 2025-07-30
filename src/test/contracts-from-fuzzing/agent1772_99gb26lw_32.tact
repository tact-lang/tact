struct X1 { a: Int }
struct X2 { b: Int }
struct X3 { c: Int }
struct X4 { d: Int }
struct X5 { e: Int }

contract Test32 {
    x1: X1;
    x2: X2;
    x3: X3;
    x4: X4;
    x5: X5;

    init() {
        self.x1 = X1{a:1};
        self.x2 = X2{b:2};
        self.x3 = X3{c:3};
        self.x4 = X4{d:4};
        self.x5 = X5{e:5};
    }
}