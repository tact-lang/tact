struct A {
    f1: Int;
    f2: Bool;
}

struct B {
    g1: String;
    g2: A;
}

struct C {
    h1: Address;
    h2: B;
}

contract Test43 {
    val: C;
    init() {
        self.val = C{
            h1: myAddress(),
            h2: B{
                g1:"s",
                g2: A{f1:4,f2:true}
            }
        };
    }
}