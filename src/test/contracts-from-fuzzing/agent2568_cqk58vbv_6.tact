struct OptionalNest {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalTest {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{ a: null, b: null, c: null };
    }
}