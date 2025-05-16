struct Inner {
    val: Int;
}

struct ComplexOpt {
    a: Int;
    b: Inner?;
    c: String;
}

contract TestContract {
    data: ComplexOpt;

    init() {
        self.data = ComplexOpt {
            a: 5,
            b: null,
            c: "str"
        };
    }

    receive() {}
}