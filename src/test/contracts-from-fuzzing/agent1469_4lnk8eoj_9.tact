struct Child {
    val: Int;
    flag: Bool;
}

struct Parent {
    c1: Child;
    c2: Child;
    optChild: Child?;
}

contract ParentHolder {
    data: Parent;

    init() {
        self.data = Parent{
            c1: Child{ val:111, flag:true },
            c2: Child{ val:222, flag:false },
            optChild: null,
        };
    }
}