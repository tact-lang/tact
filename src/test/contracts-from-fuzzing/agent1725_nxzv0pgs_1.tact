struct Nested1 {
    val1: Int;
}

struct Nested2 {
    nested: Nested1;
    val2: Bool;
}

contract TestContract {
    field: Nested2;

    init() {
        self.field = Nested2{
            nested: Nested1{
                val1: 1,
            },
            val2: true
        };
    }
}