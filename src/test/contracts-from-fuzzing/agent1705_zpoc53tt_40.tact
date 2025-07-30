message Leaf {}

struct Level2 { leaf: Leaf }
struct Level1 { l2: Level2 }

contract NestedEmptyMessageShells {
    val: Level1;

    init() {
        self.val = Level1{
            l2: Level2{
                leaf: Leaf{},
            },
        };
    }
}