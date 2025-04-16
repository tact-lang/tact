struct SubInner {
    z: Int;
}

struct Inner {
    s: SubInner;
}

struct Outer {
    i: Inner;
}

contract AnotherDeep {
    d: Outer;

    init() {
        self.d = Outer{i: Inner{s: SubInner{z:42}}};
    }
}