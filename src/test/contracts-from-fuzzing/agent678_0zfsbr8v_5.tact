struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    x: Int;
    y: Int;
    nested: Inner;
}

contract ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
    bigStruct: Outer;

    init() {
        self.bigStruct = Outer{
            x: 1,
            y: 2,
            nested: Inner{x: 3, y: 4}
        };
        self.a=11; self.b=22; self.c=33; self.d=44; self.e=55;
        self.f=66; self.g=77; self.h=88; self.i=99; self.j=100;
    }
}