struct A {
    x: Int;
    y: B?;
}
struct B {
    z: C?;
}
struct C {
    k: Int;
}

contract ChainOpt {
    val: A?;

    init() {
        self.val = A{
            x: 1,
            y: B{
                z: C{
                    k: 5
                }
            }
        };
    }
}