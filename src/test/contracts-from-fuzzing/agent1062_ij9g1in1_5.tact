struct Inner {
    val: Int;
}

struct Outer {
    inner1: Inner?;
    inner2: Inner?;
    inner3: Inner?;
}

contract MultiOptional {
    storage: Outer;

    init() {
        self.storage = Outer{
            inner1: Inner{val: 10},
            inner2: null,
            inner3: Inner{val: 30}
        };
    }
}