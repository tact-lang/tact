contract OptionalAssignmentTest {
    a: Int?;
    b: String?;
    c: Bool?;

    init() {
        self.a = null;
        self.b = null;
        self.c = true;
    }
}