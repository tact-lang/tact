struct A{
    a: Bool?;
}
struct B{
    b: A?;
}
struct C{
    c: B?;
}

contract TestContract {
    value: C;

    init() {
        self.value = C {
            c: B {
                b: A {
                    a: null,
                },
            },
        };
    }
}