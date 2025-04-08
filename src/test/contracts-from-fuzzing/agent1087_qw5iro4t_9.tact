struct A {
    x: Int;
    y: Int;
}

struct B {
    z: Int;
    inner: A;
}

struct C {
    inside: B;
    flag: Bool;
    address: Address;
}

struct D {
    nest: C;
    another: Int;
}

contract TestContract {
    superDeep: D;

    init() {
        self.superDeep = D{
            nest: C{
                inside: B{
                    z: 99,
                    inner: A{
                        x: 1,
                        y: 2,
                    },
                },
                flag: true,
                address: myAddress(),
            },
            another: 123,
        };
    }

    receive() {}
}