struct B {
    ok: Bool;
}

struct A {
    nested: B;
    nopt: B?;
}

contract NestedMixedOptionals {
    data: A;

    init() {
        self.data = A{
            nested: B{ok:true},
            nopt: null
        };
    }
}