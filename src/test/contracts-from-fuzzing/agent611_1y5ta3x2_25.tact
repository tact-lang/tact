struct X { p: Int = 5; }
struct Y { q: X? = X{}; }
contract HasY {
    field: Y;
    init() { self.field = Y{}; }
}