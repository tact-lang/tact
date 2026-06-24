struct X1 {
    a: Int;
}

struct X2 {
    x1: X1;
    b: Int;
}

struct X3 {
    x2: X2;
    c: Int;
}

contract Test21 {
    data: X3;
    init() {
        self.data=X3{
            x2:X2{
                x1:X1{a:5},
                b:6
            },
            c:7
        };
    }
}