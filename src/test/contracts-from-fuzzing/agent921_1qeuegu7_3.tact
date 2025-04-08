struct Child {
    a: Int;
    flag: Bool = false;
}

struct Parent {
    child: Child;
    amount: Int?;
}

contract OptionalsNested {
    data: Parent;

    init() {
        self.data = Parent{
            child: Child{
                a: 5
            },
            amount: null
        };
    }
}