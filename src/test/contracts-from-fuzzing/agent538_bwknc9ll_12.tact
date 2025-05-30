struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    i1: Inner;
    i2: Inner;
    text: String;
}

contract NestedMulti {
    o: Outer;

    init() {
        self.o = Outer{
            i1: Inner{a:1, b:true},
            i2: Inner{a:2, b:false},
            text: "multi"
        };
    }
}
