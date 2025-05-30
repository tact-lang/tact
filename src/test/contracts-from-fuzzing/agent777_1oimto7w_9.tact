struct A {
    intVal: Int;
    boolVal: Bool;
}

struct B {
    aVal: A;
    optStr: String?;
}

struct C {
    optB: B?;
    strVal: String;
}

contract MixedNestedContract {
    data: C;

    init() {
        self.data = C{
            optB: B{
                aVal: A{ intVal: 1, boolVal: true },
                optStr: null,
            },
            strVal: "xyz",
        };
    }
}