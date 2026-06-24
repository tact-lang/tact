struct A {
    x: Int;
}

struct B {
    a: A;
    optInt: Int?;
}

contract CombineOptionalAndNested {
    data: B;

    init() {
        self.data = B{
            a: A{ x:77 },
            optInt: null
        };
    }
}