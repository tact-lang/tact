struct OptionalDeep {
    nestedOpt: Nested1?;
}

struct Nested1 {
    val: Int?;
}

contract Test {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            nestedOpt: Nested1{
                val: null
            }
        };
    }
}