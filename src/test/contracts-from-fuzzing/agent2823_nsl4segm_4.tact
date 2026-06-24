struct A {
    x: Int;
}

struct B {
    y: Int;
    z: A;
}

contract NestedStructsOptional {
    data: B?;

    init() {
        self.data = B{
            y: 7,
            z: A{ x: 111 },
        };
    }
}