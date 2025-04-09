struct Inner { value: Int; flag: Bool; }

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract NestedRepeatedStructs {
    state: Outer;
    init() {
        self.state = Outer {
            inner1: Inner{ value: 1, flag:true },
            inner2: Inner{ value:2, flag:false }
        };
    }
}
