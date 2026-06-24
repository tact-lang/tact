struct X1 { a: Int }
struct X2 { x: X1 }
struct X3 { y: X2 }

contract ManyDeep {
    deep: X3;

    init() {
        self.deep = X3{ y: X2{ x: X1{ a:5 } } };
    }
}