struct Container {
    foo: Int;
    nested: NestedStruct;
}

struct NestedStruct {
    bar: Bool;
    label: String;
}

contract OrderCheck {
    cont: Container;

    init() {
        self.cont = Container{ foo: 15, nested: NestedStruct{ bar:true, label:"lbl" } };
    }
}