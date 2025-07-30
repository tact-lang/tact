struct C {
    x: Int;
    y: Bool;
}

struct B {
    c: C;
    val: Int?;
}

struct A {
    b: B;
}

contract DeepChain {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: C{ x:8, y:true },
                val: null
            }
        };
    }
}