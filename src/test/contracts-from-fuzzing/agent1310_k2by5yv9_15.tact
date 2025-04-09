struct Leaf { val: Int; }
struct Mid { leaf: Leaf; opt: Bool?; }
struct Outer { mid: Mid; }

contract TestContract {
    store: Outer;

    init() {
        self.store = Outer{
            mid: Mid{
                leaf: Leaf{ val: 42 },
                opt: null
            }
        };
    }
}
