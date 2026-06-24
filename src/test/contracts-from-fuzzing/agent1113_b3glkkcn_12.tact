struct Child {
    a: Int;
}

struct Parent {
    child: Child;
}

contract OptStruct {
    opt: Parent?;

    init() {
        self.opt = null;
    }
}