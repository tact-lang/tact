struct A {
    b: B;
    c: C;
}

struct B {
    d: D;
    s: String;
}

struct C {
    d: D;
    e: E;
}

struct D {
    q: Int?;
    w: Bool?;
    e: String?;
}

struct E {
    flag: Bool;
    name: String;
}

contract TestContract {
    val: A;
    init() {
        self.val = A{
            b: B{
                d: D{ q: null, w: true, e: null },
                s: "text"
            },
            c: C{
                d: D{ q: 50, w: null, e: "hi" },
                e: E{ flag: false, name: "ok" }
            }
        };
    }
}