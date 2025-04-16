struct A {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct B {
    s: A;
    optInt: Int?;
    optBool: Bool?;
}

contract TestContract {
    b: B;

    init() {
        self.b = B{
            s: A{
                f1: 5,
                f2: true,
                f3: "hi",
            },
            optInt: null,
            optBool: false,
        };
    }
}