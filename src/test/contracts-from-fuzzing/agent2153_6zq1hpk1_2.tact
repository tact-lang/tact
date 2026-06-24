struct A {
    val1: Int;
    val2: Bool;
}

struct B {
    innerA: A;
    optInt: Int?;
    flag: Bool;
}

struct C {
    nestedB: B;
    text: String;
    cond: Bool?;
}

contract ComplexContract {
    data: C;

    init() {
        self.data = C{
            nestedB: B{
                innerA: A{ val1: 5, val2: false },
                optInt: null,
                flag: true
            },
            text: "test",
            cond: null
        };
    }
}