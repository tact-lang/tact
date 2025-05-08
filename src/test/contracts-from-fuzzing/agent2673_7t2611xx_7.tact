struct Child {
    value: Int;
}

struct Parent {
    child: Child;
    optChild: Child?;
}

contract NestOptCombo {
    data: Parent;

    init() {
        self.data = Parent{ child: Child{value:1}, optChild: null };
    }
}