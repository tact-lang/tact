struct Sub2 {
    a: Int;
}
struct Sub1 {
    a: Int;
    sub2: Sub2;
}
struct Root {
    a: Int;
    sub1: Sub1;
}

contract NestedWithDefaults2 {
    root: Root = Root{
        a: 1,
        sub1: Sub1{
            a: 2,
            sub2: Sub2{ a: 3 }
        }
    };

    init() {}
}