// struct with all optional fields
struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract TestContract {
    val: Optionals;

    init() {
        self.val = Optionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}