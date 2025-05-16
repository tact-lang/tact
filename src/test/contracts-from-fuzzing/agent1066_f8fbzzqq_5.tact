struct A {
    x: Int;
    y: Int?;
}

struct B {
    a: A;
    s: String;
}

struct C {
    b: B;
    flag: Bool;
}

struct D {
    c: C;
    addr: Address;
}

contract TestContract {
    deepData: D;

    init() {
        self.deepData = D{
            c: C{
                b: B{
                    a: A{x: 42, y: null},
                    s: "nest"
                },
                flag: true
            },
            addr: myAddress()
        };
    }
}