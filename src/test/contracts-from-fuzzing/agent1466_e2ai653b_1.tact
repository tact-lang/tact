struct Inner {
    y: Int;
}

struct Outer {
    x: Int;
    inn: Inner;
}

contract Test {
    data: Outer = Outer{ x: 1, inn: Inner{ y: 2 } };
    
    init() {
        self.data = Outer{ x: 3, inn: Inner{ y: 4 } };
    }
}
