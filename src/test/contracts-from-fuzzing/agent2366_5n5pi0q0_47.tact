struct Inner {
    a: Int;
    b: Int;
}

struct Middle {
    innerA: Inner;
    innerB: Inner;
}

contract NestedInnerFields {
    m: Middle;

    init() {
        self.m = Middle{innerA:Inner{a:1,b:2}, innerB:Inner{a:3,b:4}};
    }
}