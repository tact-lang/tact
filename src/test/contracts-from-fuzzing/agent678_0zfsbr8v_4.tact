struct Inner {
    i: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract NestedOptional {
    val: Outer?;

    init() {
        self.val = Outer{
            inner1: Inner{i: 10},
            inner2: Inner{i: 20}
        };
    }
}