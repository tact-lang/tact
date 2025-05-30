// Going beyond: test struct where a deeply nested optional is then wrapped in another optional
struct Leaf { x: Int?; }
struct Middle { leaf: Leaf?; }
struct Outer { mid: Middle?; }

contract DeepWrapOpt {
    store: Outer?;
    init() {
        self.store = null;
    }
}