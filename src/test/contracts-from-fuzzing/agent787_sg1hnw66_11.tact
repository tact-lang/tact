struct Leaf { val: Int }
struct Middle { leaf: Leaf? }
struct Root { mid: Middle? }

contract TestContract {
    tree: Root = Root{ mid: null };

    init() {
        self.tree = Root{ mid: Middle{ leaf: Leaf{ val: 99 } } };
    }
}