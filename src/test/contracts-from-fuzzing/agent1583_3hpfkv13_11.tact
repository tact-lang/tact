struct OptionalInner {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Wrapper {
    inner: OptionalInner?;
    flag: Bool;
}

contract MultipleOptionals {
    data: Wrapper;

    init() {
        self.data = Wrapper{ inner: null, flag: true };
    }
}