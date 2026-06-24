struct DeepNested {
    nested1: Nested1;
}

struct Nested1 {
    nested2: Nested2;
}

struct Nested2 {
    nested3: Nested3;
}

struct Nested3 {
    nested4: Nested4;
}

struct Nested4 {
    val: Int;
}

contract TestContract {
    data: DeepNested;
    
    init() {
        self.data = DeepNested{
            nested1: Nested1{
                nested2: Nested2{
                    nested3: Nested3{
                        nested4: Nested4{
                            val: 42
                        }
                    }
                }
            }
        };
    }
}