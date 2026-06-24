struct Inner {
    v1: Int;
    v2: String;
}

struct Outer {
    f1: Inner;
    f2: Int;
}

contract TestContract {
    myField: Outer;

    init() {
        self.myField = Outer{
            f1: Inner{
                v1: 123,
                v2: "abc"
            },
            f2: 456
        };
    }
}
