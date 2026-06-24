struct Base {
    num1: Int;
}

struct Derived {
    base: Base;
    num2: Int;
}

contract StructInheritanceTest {
    data: Derived;

    init() {
        self.data = Derived{
            base: Base{ num1: 11 },
            num2: 22
        };
    }
}