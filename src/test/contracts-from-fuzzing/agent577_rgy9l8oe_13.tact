struct AlternateOrder {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int;
    f5: Bool;
    f6: String;
}

contract TestContract {
    data: AlternateOrder;

    init() {
        self.data = AlternateOrder{
            f1: 1, f2: true, f3: "x",
            f4: 2, f5: false, f6: "y"
        };
    }
}