struct Leaf { f: Int; }

struct Node1 { a: Leaf; b: Leaf; c: Leaf; d: Leaf; }

struct Node2 { a: Node1; b: Node1; }

contract VeryWideNested {
    root: Node2;

    init() {
        self.root = Node2{
            a: Node1{
                a: Leaf{f:1}, b: Leaf{f:2}, c: Leaf{f:3}, d: Leaf{f:4}
            },
            b: Node1{
                a: Leaf{f:5}, b: Leaf{f:6}, c: Leaf{f:7}, d: Leaf{f:8}
            }
        };
    }
}