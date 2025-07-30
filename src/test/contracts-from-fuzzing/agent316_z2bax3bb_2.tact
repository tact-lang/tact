struct Child {
    name: String?;
}

struct Parent {
    child: Child;
}

contract Test {
    data: Parent;

    init() {
        self.data = Parent{
            child: Child{
                name: null
            }
        };
    }
}
