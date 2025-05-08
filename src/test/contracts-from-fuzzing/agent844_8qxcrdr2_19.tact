struct IntOrString {
    num: Int;
    text: String;
}

contract OptionalStructField {
    maybe: IntOrString?;

    init() {
        self.maybe = null;
    }

    receive() {
        let _ = self.maybe;
    }
}
