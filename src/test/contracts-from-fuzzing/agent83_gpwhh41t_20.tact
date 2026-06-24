struct TwoStrings {
    a: String;
    b: String;
}

struct Node {
    left: TwoStrings?;
    right: TwoStrings?;
}

contract OptionalTree {
    root: Node?;
    init() {
        self.root = null;
    }
}
