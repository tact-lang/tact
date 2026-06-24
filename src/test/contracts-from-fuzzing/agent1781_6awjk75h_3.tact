struct Wrapper {
    inner: MaybeNested?;
}

contract OptionalInnerStructField {
    w: Wrapper;

    init() {
        self.w = Wrapper{inner: null};
    }
}

struct MaybeNested {
    val: Int;
    text: String;
}