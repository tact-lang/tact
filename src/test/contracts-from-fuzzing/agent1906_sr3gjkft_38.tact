// A contract with a persistent state field of type optional struct with optionals inside
struct Deeply {
    intfield: Int?;
    boolfield: Bool?;
}

contract OptionalStructTop {
    payload: Deeply?;

    init() {
        self.payload = null;
    }
}
