struct NestedWithOptionals {
    nested1: Nested2?;
}

struct Nested2 {
    nested3: Nested3?;
}

struct Nested3 {
    val: Int?;
}

contract NestedOptContract {
    data: NestedWithOptionals;

    init() {
        self.data = NestedWithOptionals{
            nested1: Nested2{
                nested3: Nested3{
                    val: 5,
                },
            },
        };
    }
}
