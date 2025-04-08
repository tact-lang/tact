// Contract with nested optional struct, with default null inner
struct Leaf { v: Int; }
struct Mid { leaf: Leaf?; }

contract OptionalMid {
    m: Mid;
    init() {
        self.m = Mid{ leaf: null };
    }
}