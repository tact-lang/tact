struct OptTest {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract TestContract {
    val: OptTest;

    init() {
        self.val = OptTest{
            a: null,
            b: null,
            c: null,
        };
    }
}