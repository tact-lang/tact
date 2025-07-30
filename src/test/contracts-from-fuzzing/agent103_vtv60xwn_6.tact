struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptTest {
    val: Optionals;

    init() {
        self.val = Optionals{ a: null, b: null, c: null };
    }
}