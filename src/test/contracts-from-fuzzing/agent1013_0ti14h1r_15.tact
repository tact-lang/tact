struct M1 { a: Int; }
struct M2 { b: M1; }
struct M3 { c: M2; }
struct M4 { d: M3; }
struct M5 { e: M4; }

contract FiveNest {
    f: M5;

    init() {
        self.f = M5{ e: M4{ d: M3{ c: M2{ b: M1{ a:42 } } } } };
    }
}
