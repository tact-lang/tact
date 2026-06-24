struct C {
    z: Int = 3;
    optStr: String?; // defaults null
}

struct B {
    y: Int = 2;
    c: C = C{};
}

struct A {
    x: Int = 1;
    bOpt: B?;  // optional nested struct B
}

contract TestContract {
    data: A = A{};

    init() {
        self.data = A{
            x: 11,
            bOpt: B{
                y: 22,
                c: C{z: 33, optStr: "test"}
            }
        };
    }
}