struct Nested0 {
    val: Int;
}

struct Nested1 {
    val: Nested0;
}

struct Nested2 {
    val: Nested1;
}

struct Nested3 {
    val: Nested2;
}

contract MultiDeep {
    field: Nested3;

    init() {
        self.field = Nested3{
            val: Nested2{
                val: Nested1{
                    val: Nested0{
                        val: 42,
                    },
                },
            },
        };
    }
}