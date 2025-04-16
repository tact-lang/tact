struct Nested1 { f1: Int; }
struct Nested2 { f2: Int; }
struct Nested3 { f3: Int; }
struct Nested4 { f4: Int; }

struct Container {
    a: Nested1;
    b: Nested2;
    c: Nested3;
    d: Nested4;
}

contract ManyNestings {
    data: Container;

    init() {
        self.data = Container{
            a: Nested1{f1: 1},
            b: Nested2{f2: 2},
            c: Nested3{f3: 3},
            d: Nested4{f4: 4}
        };
    }
}