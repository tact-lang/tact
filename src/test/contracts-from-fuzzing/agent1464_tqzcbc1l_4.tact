struct Nested1 {
    n2: Nested2;
}

struct Nested2 {
    n3: Nested3;
}

struct Nested3 {
    val: Int?;
}

contract TestContract {
    deep: Nested1;

    init() {
        self.deep = Nested1{
            n2: Nested2{
                n3: Nested3{
                    val: null
                }
            }
        };
    }
}