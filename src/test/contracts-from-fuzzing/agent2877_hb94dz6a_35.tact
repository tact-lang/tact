struct Nest1 { a: Int; }
struct Nest2 { b: Nest1; }
struct Nest3 { c: Nest2; }
struct Nest4 { d: Nest3; }

contract FourNest {
    f: Nest4;

    init() {
        self.f = Nest4{ d: Nest3{ c: Nest2{ b: Nest1{ a: 5 } } } };
    }
}