struct Layer2 {
    optFlag: Bool?;
    innerInt: Int;
}

struct Layer1 {
    nested: Layer2;
    outerInt: Int;
}

contract NestTest {
    field: Layer1;

    init() {
        self.field = Layer1{
            nested: Layer2{
                optFlag: null,
                innerInt: -100,
            },
            outerInt: 222,
        };
    }
}