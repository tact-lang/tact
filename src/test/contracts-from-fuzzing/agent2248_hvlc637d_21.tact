struct A {
    f1: Int;
    f2: Int?;
}

struct B {
    one: A;
    two: A?;
}

contract OptionalStructs {
    b: B;

    init() {
        self.b = B{
            one: A{f1:1, f2:null},
            two: null
        };
    }
}