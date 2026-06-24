struct Inner {
    value: Int;
    content: Slice as remaining;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{value: 9, content: "abc".asSlice()},
            flag: true
        };
    }
}