// large nested optional chain, test explicit nulls
struct X1 { a: Int?; }
struct X2 { x1: X1?; }
struct X3 { x2: X2?; }
struct X4 { x3: X3?; }
struct X5 { x4: X4?; }

contract Test {
    f: X5;
    init() {
        self.f = X5{ x4: null };
    }
}