contract InlineInit {
    foo: Int = 123;
    bar: Bool = false;
    optInt: Int?;

    init() {
        self.optInt = null;
    }
}