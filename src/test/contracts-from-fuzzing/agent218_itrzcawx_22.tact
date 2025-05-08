struct A {
    flag: Bool;
}

struct B {
    a: A;
    number: Int;
}

contract BooleanNested {
    structure: B;

    init() {
        self.structure = B{
            a: A{ flag: false },
            number: 55
        };
    }
}