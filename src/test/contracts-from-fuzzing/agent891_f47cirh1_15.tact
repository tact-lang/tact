struct StructBoolOrder {
    first: Bool;
    second: Bool;
    third: Bool;
}

contract BoolOrderingTest {
    data: StructBoolOrder;

    init() {
        self.data = StructBoolOrder{
            first: true,
            second: false,
            third: true
        };
    }
}
