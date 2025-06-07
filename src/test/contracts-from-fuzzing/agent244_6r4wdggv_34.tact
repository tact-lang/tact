struct Base {
    val: Int;
}

struct Wrapper {
    inner: Base?;
}

contract OptionalStructField {
    ref: Wrapper;

    init() {
        self.ref = Wrapper{ inner: null };
    }
}