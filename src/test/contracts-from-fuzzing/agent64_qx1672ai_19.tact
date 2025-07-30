struct Nested1 {
    a: Int;
}

struct Nested2 {
    n1: Nested1;
}

struct Nested3 {
    n2: Nested2;
}

struct Nested4 {
    n3: Nested3;
}

contract Test19 {
    deeply: Nested4;
    init() {
        self.deeply = Nested4{
            n3: Nested3{
                n2: Nested2{
                    n1: Nested1{a:123}
                }
            }
        };
    }
}