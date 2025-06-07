struct VeryDeep {
    n1: N1;
}
struct N1 {
    n2: N2;
}
struct N2 {
    n3: N3;
}
struct N3 {
    n4: N4;
}
struct N4 {
    val: Int;
}

contract TestContract {
    field: VeryDeep;

    init() {
        self.field = VeryDeep{ n1: N1{ n2: N2{ n3: N3{ n4: N4{ val: 999 } } } } };
    }
}