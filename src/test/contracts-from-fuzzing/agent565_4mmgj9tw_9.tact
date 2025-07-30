struct Inner { x: Int; y: String; }
struct Mid { a: Int; b: Inner; }

contract ManyNestedOpt {
    opt1: Mid?;
    opt2: Inner?;
    init() {
        self.opt1 = null;
        self.opt2 = Inner{ x: 1, y: "abc" };
    }
}