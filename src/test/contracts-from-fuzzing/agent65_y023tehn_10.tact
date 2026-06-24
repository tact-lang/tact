struct Nested1 { val: Int; }
struct Nested2 { nested: Nested1; val: Bool; }
struct Nested3 { nested: Nested2; val: String; }

contract Test {
    data: Nested3;

    init() {
        self.data = Nested3{
            val: "hello",
            nested: Nested2{
                val: true,
                nested: Nested1{
                    val: 42
                }
            }
        };
    }
}
