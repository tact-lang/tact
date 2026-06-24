struct Inner {
    f1: Int;
}

struct Outer {
    arr1: Inner;
    arr2: Inner;
}

contract WideNestedMulti {
    outer: Outer;

    init() {
        self.outer = Outer{
            arr1: Inner{f1:1},
            arr2: Inner{f1:2}
        };
    }
}
