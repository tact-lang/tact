struct Inner1 {
    x: Int;
}
struct Inner2 {
    y: Int?;
}
struct Inner3 {
    z: Int;
}

struct MidNested {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
}

contract ManyNestedStructs {
    s: MidNested;

    init() {
        self.s = MidNested{
            i1: Inner1{x:1},
            i2: Inner2{y:null},
            i3: Inner3{z:3}
        };
    }
}
