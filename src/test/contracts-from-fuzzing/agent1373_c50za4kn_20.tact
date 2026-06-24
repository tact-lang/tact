struct Leaf { val: Int; }
struct Mid { leaf: Leaf?; }
struct Higher { mid: Mid; }

contract Test {
    state: Higher;

    init() {
        self.state = Higher{
            mid: Mid{
                leaf: null
            }
        };
    }
}