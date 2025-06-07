struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Inner;
    optNested: Inner?;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            nested: Inner{a:1,b:true},
            optNested: null
        };
    }
}