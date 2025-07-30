struct A {
    s: String?;
}

contract AssignNullNested {
    a: A;

    init() {
        self.a = A{s: null};
    }
}