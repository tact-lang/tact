struct Inner {
    f1: Int;
    f2: Bool;
}

struct Outer {
    x: Inner;
    y: Inner;
    z: Inner;
}

contract Test {
    outerField: Outer;

    init() {
        self.outerField = Outer{
            x: Inner{f1:1,f2:true},
            y: Inner{f1:2,f2:false},
            z: Inner{f1:3,f2:true}
        };
    }
}