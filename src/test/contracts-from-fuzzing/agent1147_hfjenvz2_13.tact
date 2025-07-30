struct A {
    f1: Int;
    f2: Bool?;
}

struct B {
    nestedA: A;
    f3: String?;
}

struct C {
    fieldB: B;
    val: Int;
}

contract TestContract {
    data: C;

    init() {
        self.data = C{
            fieldB: B{
                nestedA: A{ f1:11, f2:null },
                f3: "str",
            },
            val: 99,
        };
    }
}