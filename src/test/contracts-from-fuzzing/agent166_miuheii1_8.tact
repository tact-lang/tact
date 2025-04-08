struct Base {
    a: Int;
    b: Bool;
}

struct Composite {
    one: Base;
    two: Base;
    label: String;
}

contract CompositeStorage {
    st: Composite;

    init() {
        self.st = Composite{
            one: Base{a:1, b:true},
            two: Base{a:2, b:false},
            label: "double"
        };
    }
}