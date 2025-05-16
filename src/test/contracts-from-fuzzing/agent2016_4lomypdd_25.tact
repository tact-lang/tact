struct A {
    a: Int?;
    b: B?;
}
struct B {
    c: Int?;
    d: C?;
}
struct C {
    e: Int?;
    f: D?;
}
struct D {
    g: Int?;
}

contract Test {
    deepOpt: A?;
    init() {
        self.deepOpt = null;
    }
}