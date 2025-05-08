struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestNested {
    inner: Inner;
    flag: Bool;

    init() {
        self.inner = Inner{ x: 5, y: null };
        self.flag = true;
    }

    receive() {}

    get fun getNested(): Outer {
        return Outer{ inner: self.inner, flag: self.flag };
    }
}
