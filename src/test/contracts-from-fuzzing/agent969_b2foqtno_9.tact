struct B {
    foo: Int = 99;
    bar: Bool = true;
}

struct A {
    inner: B;
    msg: String = "hello";
}

contract DefaultsInNest {
    data: A;

    init() {
        self.data = A{
            inner: B{},  // omit values, use defaults
            msg: "override"
        };
    }
}
