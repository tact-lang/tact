struct Inner {
    i1: Int;
    i2: Int;
    i3: Int;
}

struct Outer {
    o1: Inner;
    o2: Inner;
    o3: Inner;
}

contract NestedRepeatedStruct {
    store: Outer;

    init() {
        self.store = Outer{
            o1: Inner{i1:1,i2:2,i3:3},
            o2: Inner{i1:4,i2:5,i3:6},
            o3: Inner{i1:7,i2:8,i3:9}
        };
    }
}