struct Wrapper {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    x: Int;
    y: Int;
}

struct Inner2 {
    p: Bool;
    q: String;
}

contract Test19 {
    obj: Wrapper;

    init() {
        self.obj = Wrapper {
            inner1: Inner1{ x: 5, y: 6 },
            inner2: Inner2{ p: true, q: "zzz" }
        };
    }
}