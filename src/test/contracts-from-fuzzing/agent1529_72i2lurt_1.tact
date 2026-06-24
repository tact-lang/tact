struct Deep { x: Int; y: Int?; }

struct Middle { m: Deep; n: Int; }

contract NestedStructOptionalField {
    rec: Middle;

    init() {
        self.rec = Middle{ m: Deep{ x: 1, y: null }, n: 42 };
    }
}