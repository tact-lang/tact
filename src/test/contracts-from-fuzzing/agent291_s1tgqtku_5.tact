struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    a: Inner;
    b: Inner;
    c: Inner;
}

contract ManyNestedStructs {
    big: Outer;

    init() {
        self.big = Outer{
            a: Inner{x:1,y:2},
            b: Inner{x:3,y:4},
            c: Inner{x:5,y:6},
        };
    }
}