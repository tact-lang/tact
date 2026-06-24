struct Child {
    number: Int;
    yesno: Bool;
}

struct Parent {
    child: Child?;
    label: String;
}

contract OptNested {
    data: Parent;
    init() {
        self.data = Parent{
            child: null,
            label: "parent"
        };
    }
}