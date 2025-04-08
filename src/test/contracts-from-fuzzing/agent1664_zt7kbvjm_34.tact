struct PartialExample {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
}

contract IncompleteAssign {
    val: PartialExample;

    init() {
        self.val = PartialExample{
            b: 99,
            d: "text"
        };
    }
}