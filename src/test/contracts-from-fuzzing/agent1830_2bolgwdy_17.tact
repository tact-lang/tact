struct ComplexNesting {
    nested1: Nested1?;
}

struct Nested1 {
    nested2: Nested2;
}

struct Nested2 {
    nested3: Nested3?;
}

struct Nested3 {
    val: Int;
}

contract TestContract {
    data: ComplexNesting;

    init() {
        self.data = ComplexNesting{
            nested1: Nested1{
                nested2: Nested2{
                    nested3: Nested3{
                        val: 777
                    }
                }
            }
        };
    }
}
