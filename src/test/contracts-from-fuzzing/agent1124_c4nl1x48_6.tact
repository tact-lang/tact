struct Leaf { val: String; }

struct Mid { leaf: Leaf; }

struct Top { mid: Mid?; }

contract DeepOptionalNest {
    t: Top?;

    init() {
        self.t = null;
    }
}