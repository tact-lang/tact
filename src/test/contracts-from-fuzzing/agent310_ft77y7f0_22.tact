// Optional of struct holding optional of struct
struct Leaf { x: Int }
struct Mid { leaf: Leaf? }
struct Top { mid: Mid? }

contract TestContract {
    t: Top?;

    init() { self.t = null; }
}
