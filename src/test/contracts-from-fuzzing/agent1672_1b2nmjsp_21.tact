// Complex nested struct including many optionals and depths
struct D {
    w: Int?;
    x: Bool?;
    y: String?;
    z: Cell?;
}

struct C {
    d: D?;
    q: Int;
}

struct B {
    c: C;
    s: String;
}

struct A {
    b: B;
    a: Address?;
}

contract TestContract {
    field: A;
    init() {
        self.field = A{
            b: B{
                c: C{
                    d: null,
                    q: 12
                },
                s: "text"
            },
            a: myAddress()
        };
    }
}