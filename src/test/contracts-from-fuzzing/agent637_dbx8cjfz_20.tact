// persistent field with nested struct containing many optional primitives
struct InnerFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    storage: InnerFields;

    init() {
        self.storage = InnerFields{
            a: null, b: true, c: null, d: null, e: null, f: null
        };
    }
}