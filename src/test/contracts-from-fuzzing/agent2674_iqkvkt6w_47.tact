// test contract with inline default null contract fields and init assigning non-null
contract InlineNullAssignNonNull {
    a: Int? = null;
    b: Bool? = null;

    init() {
        self.a = 42;
        self.b = true;
    }
}