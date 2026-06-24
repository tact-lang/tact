struct A {
    i: Int as int8;
}
struct B {
    j: Int as uint4;
    a: A;
}
contract NestedSerialized {
    f: B;
    init() {
        self.f = B{ j:7, a:A{i:-5} };
    }
}