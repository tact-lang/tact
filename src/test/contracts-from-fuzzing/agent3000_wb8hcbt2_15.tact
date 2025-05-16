struct A {
    x: Int;
    y: Bool;
    z: String;
}

struct B {
    s: A;
    p: String?;
    q: Bool;
    r: Int;
}

contract Test15 {
    f: B;

    init() {
        self.f = B{
            s: A{ x: 1, y: false, z: "zzz" },
            p: null,
            q: true,
            r: 999,
        };
    }
}
