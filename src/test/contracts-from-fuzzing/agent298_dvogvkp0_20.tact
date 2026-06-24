struct A {
    f1: Int;
}
struct B {
    f2: Int;
}
struct C {
    a: A;
    b: B;
}
contract MultiStruct {
    x: C;
    init() {
        self.x = C{ a: A{f1:1}, b:B{f2:2} };
    }
}