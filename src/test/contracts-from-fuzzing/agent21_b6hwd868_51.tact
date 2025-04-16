struct A {
    val: Int?;
}

struct B {
    val: Int;
    nested: A;
}

struct C {
    nested: B;
}

contract ABC {
    data: C;

    init() {
        self.data = C{
            nested: B{
                val: 5,
                nested: A{ val: null }
            }
        };
    }
}