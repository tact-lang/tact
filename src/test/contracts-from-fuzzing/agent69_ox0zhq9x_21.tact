struct A {
    x: Int;
    y: Bool;
    z: String;
}

struct B {
    a: A;
    opt: A?;
}

contract NestedStructWithOptional {
    val: B;

    init() {
        self.val = B{
            a: A{ x: 1, y: true, z: "a" },
            opt: null,
        };
    }
}
