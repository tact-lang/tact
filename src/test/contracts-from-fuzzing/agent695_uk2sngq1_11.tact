struct A {
    val: Int;
}
struct B {
    s: String;
}
struct C {
    addr: Address;
}

contract ManyTypesStorage {
    f1: A;
    f2: B;
    f3: C;

    init() {
        self.f1 = A{val: 1};
        self.f2 = B{s: "s"};
        self.f3 = C{addr: myAddress()};
    }
}