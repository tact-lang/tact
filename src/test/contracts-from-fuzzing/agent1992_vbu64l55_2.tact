struct Inner {
    foo: Int;
}

struct Outer {
    bar: Int;
    innerOpt: Inner?;
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{
            bar: 1,
            innerOpt: null
        };
    }
}