struct Parent {
    id: Int;
    child: Child;
}

struct Child {
    cid: Int;
    note: String;
}

contract NestedWithString {
    dat: Parent;
    init() {
        self.dat = Parent {
            id: 100,
            child: Child { cid: 5, note: "note" }
        };
    }
}
