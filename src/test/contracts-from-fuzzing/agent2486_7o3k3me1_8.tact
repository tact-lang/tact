struct Leaf { val: Bool }

struct Node { a: Leaf; b: Leaf }

struct Root { n1: Node; n2: Node; flag: Bool }

contract Tree {
    root: Root = Root{
        n1: Node{ a: Leaf{val:true}, b: Leaf{val:false} },
        n2: Node{ a: Leaf{val:true}, b: Leaf{val:true} },
        flag: false
    };
}