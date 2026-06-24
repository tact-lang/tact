struct DefaultNested {
    nested: Inner;
}

struct Inner {
    val1: Int = 10;
    val2: Int?;
}

contract DefaultNestTest {
    field: DefaultNested;

    init() {
        self.field = DefaultNested{
            nested: Inner{
                val2: null
            }
        };
    }
}