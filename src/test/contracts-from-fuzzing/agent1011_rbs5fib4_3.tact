struct Inner {
    x: Int = 1;
    y: String = "a";
}

struct Outer {
    inner: Inner;
    flag: Bool = true;
}

contract NestedStructsContract {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{},
            flag: true,
        };
    }
}