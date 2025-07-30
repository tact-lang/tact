struct OneField { a: Int }

contract OptionalStructField {
    f: OneField?;

    init() {
        self.f = OneField { a: 32 };
    }
}