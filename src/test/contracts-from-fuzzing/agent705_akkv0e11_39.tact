struct SomeInner {
    a: Int;
    b: Bool;
}

struct Wrap1 {
    inner: SomeInner;
}

struct Wrap2 {
    inner: Wrap1;
}

struct Wrap3 {
    inner: Wrap2;
}

contract MegaNest {
    d: Wrap3;

    init() {
        self.d = Wrap3 { inner: Wrap2 { inner: Wrap1 { inner: SomeInner { a:1, b:true } } } };
    }
}