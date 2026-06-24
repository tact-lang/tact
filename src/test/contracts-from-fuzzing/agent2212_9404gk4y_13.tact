struct SiblingA {
    a: Int;
}

struct SiblingB {
    b: Bool;
}

struct Parent {
    sa: SiblingA?;
    sb: SiblingB;
}

contract Test {
    nested: Parent;

    init() {
        self.nested = Parent{
            sa: null,
            sb: SiblingB{b:false}
        };
    }
}
