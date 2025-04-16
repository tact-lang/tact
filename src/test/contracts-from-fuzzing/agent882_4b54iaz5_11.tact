struct A {
    flag: Bool;
    opt: Int?;
}

struct B {
    flag: Bool?;
    inner: A?;
}

contract ComplexOptionals {
    field: B;

    init() {
        self.field = B{
            flag: null,
            inner: null
        };
    }
}