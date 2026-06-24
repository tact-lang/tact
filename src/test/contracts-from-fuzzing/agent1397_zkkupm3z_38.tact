// deeply nested struct with default values
struct Leaf { v: Int = 7; }
struct Branch { l: Leaf; b: Bool = false; }
struct Root { br: Branch; s: String = "hi"; }

contract DefNest {
    data: Root;

    init() {
        self.data = Root{ br: Branch{ l: Leaf{} } };
    }
}