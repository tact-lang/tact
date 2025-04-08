struct Inner {
    val: Int;
}

struct Container {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
    inner4: Inner;
    inner5: Inner;
}

contract ManyNestings {
    data: Container;

    init() {
        self.data = Container{
            inner1: Inner{val:1},
            inner2: Inner{val:2},
            inner3: Inner{val:3},
            inner4: Inner{val:4},
            inner5: Inner{val:5}
        };
    }
}