struct Leaf { x: Int = 42; }
struct Mid { leaf: Leaf?; y: Bool = true; }

contract TestContract {
    outer: Mid?;

    init() {
        self.outer = Mid{
            leaf: null
            // omit y, should get y = true
        };
    }
}