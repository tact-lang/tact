struct Outer {
    a: Int;
    b: Inner;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract NestedInit {
    out: Outer;

    init() {
        self.out = Outer{a:1, b:Inner{x:5,y:null}};
    }
}