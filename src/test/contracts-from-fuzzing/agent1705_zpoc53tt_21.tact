struct Leaf { a: Int }
struct Mid { l1: Leaf; l2: Leaf }
struct Top { m1: Mid; m2: Mid }

contract ComplexNested {
    val: Top;

    init() {
        self.val = Top{
            m1: Mid{ l1:Leaf{a:1}, l2:Leaf{a:2}},
            m2: Mid{ l1:Leaf{a:3}, l2:Leaf{a:4}},
        };
    }
}