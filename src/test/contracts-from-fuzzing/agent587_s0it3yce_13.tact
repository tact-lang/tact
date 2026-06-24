struct Child {
    a: Int;
}

struct Parent {
    x: Int;
    child: Child;
}

struct Grandparent {
    y: Int;
    parent: Parent;
}

contract MultiLayer {
    tree: Grandparent;
    init() {
        self.tree = Grandparent{
            y: 9,
            parent: Parent{
                x:8,
                child: Child{ a:7 }
            }
        };
    }
    receive() {
        let _ = self.tree.parent.child.a;
    }
}