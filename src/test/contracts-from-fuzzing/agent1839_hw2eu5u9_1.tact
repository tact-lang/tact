struct Nested {
    flag: Bool;
    count: Int?;
    label: String;
}

contract ComplexFields {
    point: Nested;
    active: Bool = true;
    title: String = "hello";
    amount: Int?;

    init() {
        self.amount = 42;
        self.point = Nested{ flag: false, count: null, label: "meh" };
    }
}