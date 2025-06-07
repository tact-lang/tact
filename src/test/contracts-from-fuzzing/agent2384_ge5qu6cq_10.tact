struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    in1: Inner;
    in2: Inner;
}

contract MultiNested {
    state: Outer;

    init() {
        self.state = Outer{
            in1: Inner{x:1,y:true},
            in2: Inner{x:2,y:false}
        };
    }
}