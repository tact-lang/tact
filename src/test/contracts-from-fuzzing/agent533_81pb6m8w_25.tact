contract DeeplyNestedOptionals {
    field: A?;

    init() {
        self.field = A{
            field: B{
                field: C{
                    field: null
                }
            }
        };
    }
}

struct A {
    field: B?;
}

struct B {
    field: C?;
}

struct C {
    field: Int?;
}