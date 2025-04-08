struct Innermost { x: Int as uint4; }
struct Mid { inner: Innermost; }
struct Top { mid: Mid?; }

contract DeepOpt {
    val: Top;

    init() {
        self.val = Top{ mid: null };
    }
}