struct A {
    s: String;
}
struct B {
    s: String?;
}
struct C {
    a: A;
    b: B;
    flag: Bool;
}
contract StringMix {
    c: C;

    init() {
        self.c = C{
            a: A{s:"foo"},
            b: B{s:null},
            flag: true,
        };
    }
}