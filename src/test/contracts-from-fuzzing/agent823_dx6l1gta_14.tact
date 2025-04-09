struct GrandChild {
    val: Int = 5;
}

struct Child {
    gc: GrandChild?;
    name: String?;
}

struct Parent {
    child: Child?;
    ready: Bool;
}

contract PartialOptionals {
    p: Parent;

    init() {
        self.p = Parent{
            child: null,  // leave nested null
            ready: false
        };
    }

    receive() {}
}