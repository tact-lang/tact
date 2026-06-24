struct Deep1 { val: Int }
struct Deep2 { s: Deep1 }
struct Deep3 { s: Deep2 }
struct Deep4 { s: Deep3 }
struct Deep5 { s: Deep4 }

contract FiveNest {
    f: Deep5;

    init() {
        self.f = Deep5{ s: Deep4{ s: Deep3{ s: Deep2{ s: Deep1{ val: 555 } } } } };
    }
}