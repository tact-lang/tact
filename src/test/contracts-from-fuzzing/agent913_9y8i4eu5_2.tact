struct Nested1 {
    a: Int;
}

struct Nested2 {
    b: Nested1;
}

struct Nested3 {
    c: Nested2;
}

contract TestContract {
    deep: Nested3;
    init() {
        self.deep = Nested3{
            c: Nested2{
                b: Nested1{
                    a: 42
                }
            }
        };
    }
}