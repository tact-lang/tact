struct N1 { i: Int = 1; }
struct N2 { n1: N1; }
struct N3 { n2: N2; }
struct N4 { n3: N3; }
struct N5 { n4: N4; }

contract DeepFiveNest {
    d5: N5;

    init() {
        self.d5 = N5{ n4: N4{ n3: N3{ n2: N2{ n1: N1{} } } } };
    }
}
