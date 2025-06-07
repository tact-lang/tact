struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestNestedGetter {
    state: Outer = Outer{
        inner: Inner{ val: 99 },
        flag: false
    };

    receive() {}

    get fun getNested(): Outer {
        return self.state;
    }
}
