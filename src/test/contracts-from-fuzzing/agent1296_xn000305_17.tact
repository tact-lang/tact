struct Child {
    x: Int?;
    y: Bool?;
}

struct Parent {
    nested1: Child;
    nested2: Child;
}

contract TestContract {
    val: Parent;
    init() {
        self.val = Parent{
            nested1: Child{
                x: 3,
                y: null,
            },
            nested2: Child{
                x: null,
                y: false,
            },
        };
    }
}