struct Nested1 {
    a: Int;
}

struct Nested2 {
    b: Nested1;
}

struct Nested3 {
    c: Nested2;
}

contract DeepDeep {
    val: Nested3;

    init() {
        self.val = Nested3{
            c: Nested2{
                b: Nested1{
                    a: 42
                }
            }
        };
    }
}