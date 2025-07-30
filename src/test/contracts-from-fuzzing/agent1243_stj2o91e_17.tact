struct L1 {
    a: Int;
}
struct L2 {
    b: L1;
}
struct L3 {
    c: L2;
}
struct L4 {
    d: L3;
}
struct L5 {
    e: L4;
}
contract TestContract {
    deep: L5;

    init() {
        self.deep = L5{ e: L4{ d: L3{ c: L2{ b: L1{a: 42} } } } };
    }

    receive() {
        dump(self.deep.e.d.c.b.a);
    }
}