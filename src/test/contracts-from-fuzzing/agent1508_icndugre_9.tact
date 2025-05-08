struct A {
    x: Int;
    b: Bool;
}

struct B {
    a: A;
    s: String;
}

contract NestedStructs {
    field: B;

    init() {
        self.field = B{
            a: A{
                x: 777,
                b: false
            },
            s: "nested"
        };
    }
}
