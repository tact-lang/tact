struct Child {
    flag: Bool;
    text: String;
}

struct Parent {
    children: Child;
    status: String;
}

contract StructInStruct {
    p: Parent;

    init() {
        self.p = Parent{
            children: Child{flag: false, text: "nested"},
            status: "init"
        };
    }
}