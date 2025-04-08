// struct with mix of primitives and optional nested struct
struct Inner {
    x: Int = 111;
}

struct Outer {
    a: Int = 1;
    b: Bool?;
    c: Inner?;
    d: String = "s";
}

contract TestContract {
    f: Outer = Outer{
        a: 10,
        b: null,
        c: Inner{x:999},
        d: "hello"
    };

    init() {
        self.f = Outer{
            a: 20,
            b: true,
            c: null,
            d: "world"
        };
    }

    receive() {
        let _ = self.f.a;
        let _ = self.f.b;
        let _ = self.f.c;
        let _ = self.f.d;
    }
}