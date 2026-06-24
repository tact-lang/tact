struct Optioned {
    s: String?;
    n: Int?;
    b: Bool?;
}

contract OptionalFieldsTest {
    data: Optioned;

    init() {
        self.data = Optioned{ s: null, n: null, b: null };
    }
}