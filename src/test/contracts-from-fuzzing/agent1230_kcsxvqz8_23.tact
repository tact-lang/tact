struct ManyDefaultStrings {
    a: String = "one";
    b: String = "two";
    c: String = "three";
}

contract DefaultStrs {
    s: ManyDefaultStrings;

    init() {
        self.s = ManyDefaultStrings{};
    }
}