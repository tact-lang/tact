struct D {
    field: Int;
}

struct C {
    d: D?;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract TestNestedOptionals {
    receive(msg: Slice) {
        // Construct the nested optional structure
        let a: A = A {
            b: B {
                c: C {
                    d: D { field: 42 }
                }
            }
        };
        // Access nested fields using non-null assertions
        if (a.b!!.c!!.d!!.field == 42) {
            // Successfully accessed the deeply nested field
        }
    }
}
