// Multiple complex persistent optionals mixed
struct X { a: Int; }
struct Y { b: Bool; }

contract TestContract {
    optX: X?;
    optY: Y?;

    init() {
        self.optX = X{ a: 5 };
        self.optY = null;
    }
}
