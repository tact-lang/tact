struct Inner {
    x: Int;
    y: Int;
}

struct Middle {
    foo: Inner;
    bar: Bool;
}

struct Outer {
    a: Middle;
    b: Inner;
}

contract MultiNested {
    data: Outer;
    
    init() {
        self.data = Outer{
            a: Middle{
                foo: Inner{ x: 1, y: 2 },
                bar: true
            },
            b: Inner{ x: 3, y: 4 }
        };
    }
}