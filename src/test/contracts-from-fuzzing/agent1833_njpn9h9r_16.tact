struct Child {
    code: Int? as uint16;
}

struct Parent {
    child: Child;
}

contract OptionalWithSerialization {
    data: Parent;
    init() {
        self.data = Parent{ child: Child{ code: null } };
    }
}
