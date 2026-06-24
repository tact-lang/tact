struct OptNest {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract OptNestTest {
    data: OptNest;

    init() {
        self.data = OptNest{ a: null, b: null, c: null };
    }
}