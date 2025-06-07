struct Inner {
    a: Int = 5;
    b: Bool = false;
}

struct Outer {
    inner: Inner?;
    c: String = "ok";
}

contract OptStructDefault {
    s: Outer;

    init() {
        self.s = Outer{ inner: null };
    }
}