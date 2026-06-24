struct MultiNested {
    a: Int;
    b: Bool;
    c: Inner;
    d: Middle;
}

struct Inner {
    x: Int;
}

struct Middle {
    y: Int;
    z: Bool?;
}

contract Complex {
    state: MultiNested;

    init() {
        self.state = MultiNested{
            a:1,
            b:false,
            c:Inner{x:2},
            d:Middle{y:3,z:null},
        };
    }
}