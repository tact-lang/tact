struct Nested1 {
    val: Int;
}

struct Nested2 {
    val: Nested1;
}

struct Nested3 {
    val: Nested2;
}

struct Nested4 {
    val: Nested3;
}

contract TestContract {
    deep: Nested4;

    init() {
        self.deep = Nested4{
            val: Nested3{
                val: Nested2{
                    val: Nested1{ val: 42 }
                }
            }
        };
    }
}