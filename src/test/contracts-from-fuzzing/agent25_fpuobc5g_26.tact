// nested struct with cell and string optionals
struct Nested {
    cellVal: Cell?;
    strVal: String?;
}
contract Test {
    f: Nested;
    init() {
        self.f = Nested{ cellVal: null, strVal: null };
    }
}