struct A {
    s: String;
}
struct B {
    ap: A?;
}
struct C {
    b: B?;
}

contract DoubleDeepOptional {
    c: C;
    init() {
        self.c = C{
            b: B{
                ap: A{ s: "x" }
            }
        };
    }
}