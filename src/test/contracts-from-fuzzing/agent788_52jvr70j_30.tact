struct A {
    foo: Int?;
}

struct B {
    bar: A?;
}

contract DoubleOptional {
    val: B;

    init() {
        self.val = B{
            bar: null
        };
    }
}