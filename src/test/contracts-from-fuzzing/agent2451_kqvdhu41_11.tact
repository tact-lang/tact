struct Medium {
    id: Int;
    note: String;
}

struct Container {
    m: Medium;
    optStr: String?;
    optBool: Bool?;
    flag: Bool;
}

contract NestedWithOptionals {
    field: Container;

    init() {
        self.field = Container{
            m: Medium{ id: 77, note: "hey" },
            optStr: null,
            optBool: null,
            flag: true
        };
    }
}