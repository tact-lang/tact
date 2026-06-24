struct B {
    x: Int;
    y: Bool?;
}

struct A {
    nested: B?;
}

contract MaybeNested {
    val: A;

    init() {
        self.val = A{
            nested: null
        };
    }
}
