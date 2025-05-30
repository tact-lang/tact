struct FieldsWithDifferentOrders {
    flag: Bool;
    text: String;
    count: Int;
    optStr: String?;
}

contract OrderFieldsTest {
    data: FieldsWithDifferentOrders;

    init() {
        self.data = FieldsWithDifferentOrders{
            flag: false,
            text: "abc",
            count: 0,
            optStr: null,
        };
    }

    receive() {
        self.data;
    }
}