struct S {
    s1: Int; s2: Bool; s3: Address; s4: Cell; s5: Slice; s6: String;
}

struct Wrapper {
    inner: S?;
}

contract OptionalStructField {
    w: Wrapper;

    init() {
        self.w = Wrapper{ inner: null };
    }
}