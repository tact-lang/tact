struct A {
    valueA: Int;
}

struct B {
    valueB: Int;
    nested: A;
}

struct C {
    nestedB: B;
    flag: Bool;
    note: String;
}

contract TestContract {
    complex: C;

    init() {
        self.complex = C{
            nestedB: B{
                valueB: 1,
                nested: A{
                    valueA: 42,
                }
            },
            flag: true,
            note: "note",
        };
    }
}