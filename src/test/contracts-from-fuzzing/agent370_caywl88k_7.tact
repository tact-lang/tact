struct OptionalTest {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptContract {
    val: OptionalTest;

    init() {
        self.val = OptionalTest{a: null, b: true, c: null};
    }
}