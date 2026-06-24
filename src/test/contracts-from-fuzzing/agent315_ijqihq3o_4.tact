struct BigNested {
    x: Int;
    y: StructInsideBig?;
}

struct StructInsideBig {
    flag: Bool;
    text: String?;
}

contract BigNestedTest {
    field: BigNested;

    init() {
        self.field = BigNested{
            x: 5,
            y: StructInsideBig{
                flag: true,
                text: null,
            },
        };
    }
}