struct C {
    q: Int = 5;
    r: Bool? = null;
}

struct B {
    c: C;
    s: String?;
}

struct A {
    b: B;
    flag: Bool = true;
}

contract CascadeDefaults {
    val: A;

    init() {
        self.val = A{
            b: B{
                c: C{}, // rely on inner-most defaults
                s: null
            },
            flag: false
        };
    }
}