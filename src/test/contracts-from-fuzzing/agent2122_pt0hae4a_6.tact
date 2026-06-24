struct Child {
    foo: Int;
    bar: String;
}

contract OptionalStructField {
    data: Child?;

    init() {
        self.data = null;
    }
}