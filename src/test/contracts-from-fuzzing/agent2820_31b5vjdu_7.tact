struct Child {
    data: Int;
}

struct Parent {
    child: Child?;
    value: Int;
}

contract OptionalFieldInsideStruct {
    persist: Parent;

    init() {
        self.persist = Parent{
            child: null,
            value: 1
        };
    }
}