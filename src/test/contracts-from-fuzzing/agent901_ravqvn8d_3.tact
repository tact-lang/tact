struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    foo: Inner;
    bar: Inner;
}

contract NestedStruct {
    val: Outer;

    init() {
        self.val = Outer{
            foo: Inner{a:1, b:true},
            bar: Inner{a:2, b:false}
        };
    }
}