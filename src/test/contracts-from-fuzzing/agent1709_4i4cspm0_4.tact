struct OptSub {
    s: String;
    b: Bool;
}

contract OptionalNestedStructField {
    sub: OptSub?;

    init() {
        self.sub = null;
    }
}