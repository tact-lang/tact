struct A {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct B {
    inner: A;
    label: String;
}

contract InheritNested {
    b: B;
    init() {
        self.b = B{
            inner: A{ f1: 1, f2: false, f3: "hi" },
            label: "label"
        };
    }
}