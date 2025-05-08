struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    i: Int;
    nested: Inner;
    optNested: Inner?;
}

contract NestedStructsContract {
    state: Outer;

    init() {
        self.state = Outer{
            i: 5,
            nested: Inner{a:1,b:true},
            optNested: null
        };
    }
}