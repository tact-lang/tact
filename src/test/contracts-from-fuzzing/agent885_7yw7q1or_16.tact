// persistent field is optional struct with all value types optional inside
struct SuperOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract FullyOptional {
    data: SuperOpt?;

    init() {
        self.data = null;
    }
}
