struct Inner {
    x: Bool;
    y: String;
    z: Int?;
}

struct Outer {
    aa: Int;
    bb: Inner;
    cc: String;
}

contract DeepTest {
    s: Outer;
    
    init() {
        self.s = Outer{
            aa: 5,
            bb: Inner{x: false, y: "deep", z: null},
            cc: "outer"
        };
    }
}
