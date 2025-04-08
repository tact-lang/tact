struct InnerNested {
    val: Int?;
    flag: Bool?;
}

struct OuterNested {
    number: Int;
    nested: InnerNested?;
}

contract TestContract {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            number: 1,
            nested: null,
        };
    }
}