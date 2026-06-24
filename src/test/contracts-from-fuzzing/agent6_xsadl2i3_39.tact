struct Inner {
    v: Int;
}

contract OptionalStrange {
    data: Inner? = null;

    init() {
        // leave data = null
    }
}