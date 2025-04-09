// Both optional struct and optional primitive fields
struct NestedOpt {
    a: Int?;
    b: Bool;
}

contract MixedOptionals {
    field: NestedOpt?;
    val: Int?;

    init() {
        self.field = NestedOpt{a:null,b:true};
        self.val = null;
    }
}