struct Inner {
    b: Bool;
    s: String;
}

struct Middle {
    opt: Inner?;
    v: Int;
}

contract OptionalNestedStruct {
    field: Middle;

    init() {
        self.field = Middle{
            opt: Inner{b:true, s:"X"},
            v:7,
        };
    }
}