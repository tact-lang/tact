struct OptTest {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract Test {
    val: OptTest;

    init() {
        self.val = OptTest{
            a: null,
            b: null,
            c: true,
        };
    }
}