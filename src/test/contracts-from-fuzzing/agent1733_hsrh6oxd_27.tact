struct X {
    a: Int;
    b: Int?;
}

struct Y {
    a: X;
    b: X;
}

contract TestContract {
    data: Y;

    init() {
        self.data = Y{
            a: X{ a:1, b:null },
            b: X{ a:2, b:null }
        };
    }
}