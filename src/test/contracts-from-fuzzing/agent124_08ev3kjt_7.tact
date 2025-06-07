struct Nest1 { x: Int; }
struct Nest2 { s: Nest1; }
struct Nest3 { s: Nest2; }
struct Nest4 { s: Nest3; }
struct Nest5 { s: Nest4; }
contract DeepFiveNest {
    s: Nest5;
    init() {
        self.s = Nest5{ s: Nest4{ s: Nest3{ s: Nest2{ s: Nest1{ x: 10 } } } } };
    }
}