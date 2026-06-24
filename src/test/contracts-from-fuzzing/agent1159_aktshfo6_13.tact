struct Child {
    intVal: Int;
    strVal: String;
}

struct Parent {
    childOpt: Child?;
    flag: Bool;
}

contract TestContract {
    parentOpt: Parent?;

    init() {
        self.parentOpt = Parent{
            childOpt: Child{intVal: 1, strVal: "hi"},
            flag: true
        };
    }
}