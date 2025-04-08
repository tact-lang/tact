struct A {
    x: Int;
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
            a1:A{x:1}, a2:A{x:2}, a3:A{x:3}, a4:A{x:4}, a5:A{x:5},
            a6:A{x:6}, a7:A{x:7}, a8:A{x:8}, a9:A{x:9}, a10:A{x:10}
        };
    }
}