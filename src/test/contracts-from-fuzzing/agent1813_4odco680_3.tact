struct X { a: Int; opt1: Bool?; s: String; opt2: Slice?; }

contract OptionalFields {
    stuff: X;

    init() {
        self.stuff = X{ a: 1, opt1: null, s: "", opt2: null };
    }
}