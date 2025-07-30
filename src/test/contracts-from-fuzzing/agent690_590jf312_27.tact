struct Outer {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    foo: Int;
    bar: Bool;
}

struct Inner2 {
    x: Slice;
    y: Cell;
    z: String;
}

contract BothInner {
    store: Outer;

    init() {
        self.store = Outer{
            inner1: Inner1{
                foo:1,
                bar:true
            },
            inner2: Inner2{
                x:emptyCell().asSlice(),
                y:emptyCell(),
                z:"abc"
            }
        };
    }
}