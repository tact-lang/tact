struct OptLevel2 {
    q: Int?;
}

struct OptLevel1 {
    p: OptLevel2?;
}

contract OptionalNested {
    inner: OptLevel1?;

    init() {
        self.inner = OptLevel1{ p: OptLevel2{ q: 7 } };
    }
}