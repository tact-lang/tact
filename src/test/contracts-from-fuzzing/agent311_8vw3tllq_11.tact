struct A {
    b: B;
}
struct B {
    c: C;
}
struct C {
    d: D;
}
struct D {
    val: Int;
    flag: Bool;
    name: String;
}

contract NestedStructs {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: C{
                    d: D{
                        val: 42,
                        flag: true,
                        name: "deep"
                    }
                }
            }
        };
    }
}