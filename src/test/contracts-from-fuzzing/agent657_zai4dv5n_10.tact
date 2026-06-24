struct Inner {
    s: String;
    b: Bool;
}

struct Outer {
    o1: Inner;
    o2: Inner;
    o3: Inner;
    o4: Inner;
    o5: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            o1: Inner{s: "a", b: true},
            o2: Inner{s: "b", b: false},
            o3: Inner{s: "c", b: true},
            o4: Inner{s: "d", b: false},
            o5: Inner{s: "e", b: true}
        };
    }
}