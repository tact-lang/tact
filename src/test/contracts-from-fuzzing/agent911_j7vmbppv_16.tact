struct Child {
    number: Int;
}

struct Parent {
    child: Child?;
    flag: Bool;
}

contract OptionalChildStruct {
    data: Parent;

    init() {
        self.data = Parent{
            child: null,
            flag: true
        };
    }
}