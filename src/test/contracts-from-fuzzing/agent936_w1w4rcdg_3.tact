struct Nested1 {
    val: Int;
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

contract DeepNest {
    nested: Nested4;

    init() {
        self.nested = Nested4{
            n3: Nested3{
                n2: Nested2{
                    n1: Nested1{
                        val: 7
                    }
                }
            }
        };
    }
    
    receive() {
        let _ = self.nested.n3.n2.n1.val;
    }
}