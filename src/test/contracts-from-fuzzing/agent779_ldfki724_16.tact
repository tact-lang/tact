struct FieldsOrder {
    first: Int;
    second: Bool;
    third: Int?;
    fourth: Bool?;
    fifth: String;
    sixth: String?;
}

contract OrderingTest {
    val: FieldsOrder;

    init() {
        self.val = FieldsOrder{
            first: 1,
            second: false,
            third: null,
            fourth: null,
            fifth: "hi",
            sixth: null
        };
    }
}