struct A {
    f: Int;
}

struct B {
    g: A;
}

contract CrossNested {
    val: B;

    init() {
        self.val = B{
            g: A{
                f: 123
            }
        };
    }
}