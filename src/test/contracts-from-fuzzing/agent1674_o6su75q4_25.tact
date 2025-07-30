struct Child {
    label: String = "child";
    data: Int? = null;
    flag: Bool;
}

struct Parent {
    info: Child?;
    note: String? = null;
}

contract DefaultPropagation {
    meta: Parent;

    init() {
        self.meta = Parent{
            info: null,
            note: null,
        };
    }
}