struct Leaf { a: Int; }
struct Middle { l: Leaf; }
struct Top { m: Middle; }

contract PartialOuterOnly {
    t: Top = Top{ m: Middle{ l: Leaf{ a: 42 } } };

    init() {
        // no assignment
    }
}
