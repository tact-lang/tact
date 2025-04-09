struct Inner {
    x: Int;
    y: Int;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    m: Middle;
    val: Int;
}

contract DeepNested {
    value: Outer;
    init() {
        self.value = Outer{
            m: Middle{
                inner: Inner{x: 1, y: 2},
                flag: true
            },
            val: 100
        };
    }
}