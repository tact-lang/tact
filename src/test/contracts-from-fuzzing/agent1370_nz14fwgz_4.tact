struct A {
    num: Int;
    flag: Bool;
    text: String;
}

struct B {
    nested: A;
}

struct C {
    nestedB: B;
}

contract NestedWrapped {
    field: C;

    init() {
        self.field = C{
            nestedB: B{
                nested: A{ num: 1, flag: true, text: "hello" }
            }
        };
    }
}