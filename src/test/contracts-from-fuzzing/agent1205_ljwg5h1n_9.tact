struct NestedWithOptionals {
    a: Int?;
    b: Bool?;
    c: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    nestedOpt: NestedWithOptionals;
    
    init() {
        self.nestedOpt = NestedWithOptionals{a: null, b: null, c: null};
    }
}