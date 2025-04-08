struct A {
    val: Int;
}

struct B {
    a1: A;
    a2: A;
    a3: A;
    a4: A;
    a5: A;
    a6: A;
    a7: A;
    a8: A;
    a9: A;
    a10: A;
}

contract TestContract {
    data: B;

    init() {
        self.data = B{
            a1: A{val:1}, a2: A{val:2}, a3: A{val:3}, a4: A{val:4}, a5: A{val:5},
            a6: A{val:6}, a7: A{val:7}, a8: A{val:8}, a9: A{val:9}, a10: A{val:10},
        };
    }
}