struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    a: Inner;
    b: Inner;
    c: Inner;
    d: Inner;
}

contract NestedMulti {
    value: Outer;

    init() {
        self.value = Outer{
            a: Inner{ x:1, y:true },
            b: Inner{ x:2, y:false },
            c: Inner{ x:3, y:true },
            d: Inner{ x:4, y:false },
        };
    }
}