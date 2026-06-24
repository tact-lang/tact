struct DefaultInner {
    x: Int = 42;
}

struct Outer {
    inner: DefaultInner;
}

contract DefaultOptStruct {
    data: Outer?;
    init() {
        self.data = null;
    }
    receive() {}
}