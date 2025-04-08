struct A {
    num: Int;
    b: B;
}

struct B {
    flag: Bool;
    c: C;
}

struct C {
    address: Address;
    d: D;
}

struct D {
    value: Int;
    optionalBool: Bool?;
}

contract TestContract {
    nestedDeep: A;

    init() {
        self.nestedDeep = A{
            num: 1,
            b: B{
                flag: true,
                c: C{
                    address: myAddress(),
                    d: D{
                        value: 42,
                        optionalBool: null,
                    },
                },
            },
        };
    }
}
