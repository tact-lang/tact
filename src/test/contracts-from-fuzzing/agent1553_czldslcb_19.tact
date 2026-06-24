struct Sub1 {
    a: Int;
}
struct Sub2 {
    s1: Sub1;
}
struct Sub3 {
    s2: Sub2;
}
contract MultiLayer {
    data: Sub3;
    init() {
        self.data = Sub3{ s2: Sub2{ s1: Sub1{ a: 5 } } };
    }
}