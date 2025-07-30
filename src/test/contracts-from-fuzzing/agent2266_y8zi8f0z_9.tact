struct Param {
    label: String;
    amount: Int;
    comment: String?;
}

contract Test {
    param1: Param;
    param2: Param;

    init() {
        self.param1 = Param{label: "fee", amount: 1000, comment: null};
        self.param2 = Param{label: "tax", amount: 200, comment: "yearly"};
    }
}