struct Child {
    x: Int;
    opt: Int?;
}

struct Parent {
    child: Child;
    another: Int;
}

contract TestContract {
    p: Parent;

    init() {
        self.p = Parent{ child: Child{ x:4, opt:null }, another: 5 };
    }
}