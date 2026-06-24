struct Inner {
    nested1: Int;
    nested2: Int;
    nested3: Int;
    nested4: Int;
    nested5: Int;
}

struct Outer {
    inner: Inner;
    value: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer {
            inner: Inner{
                nested1: 1,
                nested2: 2,
                nested3: 3,
                nested4: 4,
                nested5: 5,
            },
            value: 10
        };
    }
}