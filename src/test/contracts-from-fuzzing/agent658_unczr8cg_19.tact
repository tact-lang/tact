struct A {
    s: String;
}

struct B {
    a: A;
}

contract NestedStringStruct {
    b: B;

    init() {
        self.b = B{
            a: A{s: "hello"}
        };
    }
}