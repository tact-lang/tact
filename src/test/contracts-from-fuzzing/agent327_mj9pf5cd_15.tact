struct MixedFields {
    b: Bool = true;
    s: String = "hello";
    n: Int = 777;
}

contract MixedPrimitives {
    rec: MixedFields;

    init() {
        self.rec = MixedFields{};
    }
}
