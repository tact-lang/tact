struct Nested {
    b: Int;
}

contract DeepOptional {
    field1: Int;
    field2: Bool?;
    field3: Cell?;
    field4: Nested?;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = emptyCell();
        self.field4 = Nested{b: 10};
    }
}