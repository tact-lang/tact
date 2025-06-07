struct X1 { a: Int?; }
struct X2 { a: X1?; }
struct X3 { a: X2?; }
struct X4 { a: X3?; }

contract NestedOptionals {
    data: X4?;
    init() {
        self.data = null;
    }
}