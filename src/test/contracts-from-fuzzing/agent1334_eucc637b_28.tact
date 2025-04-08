struct WeirdOrder {
    first: Int;
    second: Bool;
    third: String;
    fourth: Int?;
    fifth: Bool?;
    sixth: String?;
}

contract OrderTest {
    val: WeirdOrder;

    init() {
        self.val = WeirdOrder {
            first: 1,
            second: true,
            third: "hi",
            fourth: null,
            fifth: null,
            sixth: null
        };
    }
}