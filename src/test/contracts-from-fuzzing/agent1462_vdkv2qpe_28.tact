// Optional for some deeply nested struct layer
struct Deepest { val: Int; }
struct Mid { d: Deepest?; }
struct Top { m: Mid; }

contract OptionalDeep {
    t: Top;

    init() {
        self.t = Top{ m: Mid{ d: null } };
    }
}