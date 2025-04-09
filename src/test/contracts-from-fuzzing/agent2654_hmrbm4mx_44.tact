struct X { a: Int; } 
contract FieldPunning {
    x: X;

    init() {
        let a = 7;
        self.x = X{ a };
    }
}