struct OptionalNested {
    val1: Int?;
    val2: Int?;
}

struct OuterBox {
    nested: OptionalNested?;
}

contract OptionalInOptional {
    ob: OuterBox;

    init() {
        self.ob = OuterBox{
            nested: OptionalNested{
                val1: 10,
                val2: 20
            }
        };
    }
}