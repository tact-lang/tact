struct Sibling {
    a: Int?;
    b: Bool;
}

struct Parent {
    sib1: Sibling;
    sib2: Sibling?;
    val: Int;
}

contract SiblingMixStorage {
    nested: Parent;

    init() {
        self.nested = Parent{
            sib1: Sibling{
                a: null,
                b: true,
            },
            sib2: null,
            val: 777,
        };
    }

    receive() {}
}