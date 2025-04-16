struct Child {
    id: Int;
    label: String;
}

struct Parent {
    cid: Child?;
    active: Bool;
}

contract OptStructRef {
    val: Parent;
    init() {
        self.val = Parent {
            cid: null,
            active: true
        };
    }
}