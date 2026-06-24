struct A {
    x: Int?;
}

struct B {
    y: A?;
}

contract NestedOptionals {
    data: B;
    init() {
        self.data = B{
            y: A{
                x: null
            }
        };
    }
}