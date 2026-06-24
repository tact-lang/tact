struct X { a: Int; b: Bool?; }

contract TrailingComma {
    s: X;

    init() {
        self.s = X{
            b: null,
            a: 5,
        };
    }
}