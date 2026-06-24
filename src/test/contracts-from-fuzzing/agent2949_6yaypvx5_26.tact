struct A {
    val: Int;
}

struct B {
    val: Int;
}

struct Outer {
    first: A;
    second: B;
}

contract SameNamedFieldsNested {
    data: Outer;

    init() {
        self.data = Outer{
            first: A{ val: 1 },
            second: B{ val: 2 }
        };
    }
}
