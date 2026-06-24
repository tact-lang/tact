struct DataHolder {
    n: Int;
    s: String;
    b: Bool;
}

contract OptionalDefaultNested {
    info: DataHolder? = null;

    init() {
        // no assignment, rely on default null
    }
}
