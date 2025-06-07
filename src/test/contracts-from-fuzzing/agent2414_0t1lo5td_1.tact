struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract NestedStructStorage {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 10,
                y: true
            },
            flag: false
        };
    }
}