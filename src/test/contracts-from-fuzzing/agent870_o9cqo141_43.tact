struct StrOrder {
    zed: String;
    alpha: String;
    mid: String;
}

contract CheckStrOrder {
    item: StrOrder;

    init() {
        self.item = StrOrder{ zed: "z", alpha: "a", mid: "m" };
    }
}