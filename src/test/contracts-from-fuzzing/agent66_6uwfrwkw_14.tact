struct A {
    x: Int?;
}

struct B {
    a: A?;
}

contract NestedOptStructs {
    val: B;

    init() {
        self.val = B{
            a: null
        };
    }
}