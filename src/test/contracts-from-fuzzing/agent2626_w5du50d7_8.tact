struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    a: Int; 
    b: Inner;
    c: Int;
    d: Inner;
}

contract MultipleNested {
    storage: Outer;

    init() {
        self.storage = Outer{
            a: 5,
            b: Inner{x:1, y:2},
            c: 10,
            d: Inner{x:3, y:4}
        };
    }
}