struct A {
    flag: Bool?;
}

struct B {
    inner: A?;
}

contract DoubleOptional {
    val: B;

    init() {
        self.val = B {
            inner: null
        };
    }
}