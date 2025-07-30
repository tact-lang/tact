struct Base1 {
    a: Int;
}

struct Base2 {
    b: Int;
}

struct Complex {
    x: Base1;
    y: Base2;
}

contract MultiStructs {
    data: Complex;

    init() {
        self.data = Complex{ x: Base1{a:1}, y: Base2{b:2} };
    }

    receive() {
        self.data = Complex{ x: Base1{a:3}, y: Base2{b:4} };
    }
}