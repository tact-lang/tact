struct Child {
    age: Int;
}

struct Parent {
    child: Child;
    note: String?;
}

struct Grandparent {
    parent: Parent;
    message: String;
}

contract Family {
    tree: Grandparent;
    init() {
        self.tree = Grandparent{
            parent: Parent{
                child: Child{
                    age: 5
                },
                note: null
            },
            message: "hi"
        };
    }
}