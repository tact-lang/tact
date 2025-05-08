struct FieldsOrder {
    flag: Bool;
    amount: Int;
    note: String;
}

contract OrderMatters {
    val: FieldsOrder;

    init() {
        self.val = FieldsOrder{
            flag: true,
            amount: 999,
            note: "important"
        };
    }
}