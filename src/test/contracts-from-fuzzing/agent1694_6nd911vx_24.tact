struct Leaf { emoji: String; }
struct Node { child: Leaf; }
struct Tree { root: Node; }

contract EmojiTree {
    data: Tree;

    init() {
        self.data = Tree{ root: Node{ child: Leaf{emoji: "💡🔥"} } };
    }
}