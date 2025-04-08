struct Wrap1 { p1: Int; }
struct Wrap2 { p2: Wrap1; }
struct Wrap3 { p3: Wrap2; }
struct Wrap4 { p4: Wrap3; }
struct Wrap5 { p5: Wrap4; }

contract FiveNest {
    data: Wrap5;

    init() {
        self.data = Wrap5{ p5: Wrap4{ p4: Wrap3{ p3: Wrap2{ p2: Wrap1{ p1:42 } } } } };
    }
}