struct A {
    optInt: Int?;
    optBool: Bool?;
}

struct B {
    a: A;
    num: Int;
}

contract OptionalCombo {
    b: B;

    init() {
        self.b = B{
            a: A{ optInt:null, optBool:null },
            num: 5
        };
    }
}