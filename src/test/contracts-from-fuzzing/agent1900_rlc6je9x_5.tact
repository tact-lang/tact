struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    one: Inner;
    two: Inner;
    three: Inner;
}

contract NestedMultiple {
    nested: Outer;

    init() {
        self.nested = Outer{
            one: Inner{x:1,y:true},
            two: Inner{x:2,y:false},
            three: Inner{x:3,y:true},
        };
    }
}