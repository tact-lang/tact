// giant linear chain nested structs
struct N4 { val: Int; }
struct N3 { sub: N4; }
struct N2 { sub: N3; }
struct N1 { sub: N2; }

contract ChainTest {
    s: N1;

    init() {
        self.s = N1{ sub: N2{ sub: N3{ sub: N4{ val: 42 }}}};
    }
}
