struct Child {
    data: Int?;
}

struct Parent {
    child: Child?;
}

contract OptionalStructChain {
    root: Parent?;
    init() {
        self.root = null;
    }
}