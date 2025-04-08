struct A {
    a_val: Int;
}

struct B {
    b_val: Int;
    a_struct: A;
}

struct C {
    c_val: Int;
    b_struct: B;
}

contract DeepNestedStructContract {
    deep: C;

    init() {
        self.deep = C{
            c_val: 3,
            b_struct: B{
                b_val: 2,
                a_struct: A{ a_val: 1 }
            }
        };
    }
}