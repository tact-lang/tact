struct A {
    intField: Int;
    boolField: Bool;
}

struct B {
    a: A;
    maybeA: A?;
}

contract NestedStructWithOptional {
    data: B;

    init() {
        self.data = B{
            a: A{intField:1,boolField:true},
            maybeA: null
        };
    }
}