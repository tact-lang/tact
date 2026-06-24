struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    a: Inner;
    b: Inner;
    c: Inner;
}

contract NestedStructs
{
    data: Outer;
    init() {
        self.data = Outer{
            a: Inner{ x:1, y:true },
            b: Inner{ x:2, y:false },
            c: Inner{ x:3, y:true },
        };
    }
}