struct Inner {
    x: Int as uint8;
    y: Int as uint16;
    z: Int as uint32;
}

struct Outer {
    a: Inner;
    b: Inner;
}

contract SerializedNested {
    state: Outer;

    init() {
        self.state = Outer{
            a: Inner{x:1,y:2,z:3},
            b: Inner{x:4,y:5,z:6}
        };
    }
}