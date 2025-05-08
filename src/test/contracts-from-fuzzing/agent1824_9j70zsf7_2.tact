struct Inner {
    value: Int;
    flag: Bool;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{value: 10, flag: true},
            inner2: Inner{value: 20, flag: false},
        };
    }
}
