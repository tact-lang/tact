// Testing ordering of fields with default + non-default + optional
struct WeirdOrder {
    a: Int;         // no default
    b: Bool?;      // optional
    c: Int = 5;    // default
    d: String?;    // optional
    e: String = "hi"; // default
}

contract TestContract {
    val: WeirdOrder;

    init() {
        self.val = WeirdOrder{
            a: 1,
            b: null,
            d: null,
        };
    }
}