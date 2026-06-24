struct Flat {
    val1: Int;
    val2: Int;
    val3: Int;
}

struct Nested1 {
    flat: Flat;
}

struct Nested2 {
    nested1: Nested1;
}

struct Nested3 {
    nested2: Nested2;
}

contract TestContract {
    deep: Nested3;

    init() {
        self.deep = Nested3{
            nested2: Nested2{
                nested1: Nested1{
                    flat: Flat{ val1:1, val2:2, val3:3 }
                }
            }
        };
    }
}