struct DeepNested {
    n1: Nested1;
}

struct Nested1 {
    n2: Nested2;
}

struct Nested2 {
    n3: Nested3;
}

struct Nested3 {
    n4: Nested4;
}

struct Nested4 {
    val: Int;
}

contract TestContract {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            n1: Nested1{
                n2: Nested2{
                    n3: Nested3{
                        n4: Nested4{ val: 42 }
                    }
                }
            }
        };
    }
}