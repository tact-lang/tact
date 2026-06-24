struct OneField {
    a: Int;
}

contract OptionalStructDefault {
    f: OneField? = null;

    init() {
        // test default null
    }
}
