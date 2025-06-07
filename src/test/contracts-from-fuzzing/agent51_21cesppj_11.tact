struct A {
    value: Int;
}

struct B {
    inner: A;
}

struct C {
    nested: B;
}

contract ManyLayersEmbedded {
    inside: C;

    init() {
        self.inside = C{
            nested: B{
                inner: A{
                    value: 99
                }
            }
        };
    }
}