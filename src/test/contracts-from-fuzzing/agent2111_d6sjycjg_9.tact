struct A {
    s: String;
}

struct B {
    a1: A;
    a2: A;
    a3: A;
    a4: A;
    a5: A;
}

contract ManyNestedStrings {
    data: B;

    init() {
        self.data = B{
            a1: A{s: "x"},
            a2: A{s: "y"},
            a3: A{s: "z"},
            a4: A{s: "w"},
            a5: A{s: "v"}
        };
    }
}