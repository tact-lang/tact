struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFieldsTest {
    val: Opts;

    init() {
        self.val = Opts{};
    }
}
