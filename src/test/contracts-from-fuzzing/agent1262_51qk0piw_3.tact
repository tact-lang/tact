struct InnerA {
    a: Int;
}

struct InnerB {
    b: Bool;
}

struct Container {
    a: InnerA;
    b: InnerB;
}

contract ManyNestedStructs {
    data: Container = Container{
        a: InnerA{a: 4},
        b: InnerB{b: true},
    };
}