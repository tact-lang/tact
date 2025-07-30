struct SubStruct {
    a: Int;
    b: Bool;
}

struct Holder {
    sub: SubStruct?;
}

contract OptionalSubTest {
    data: Holder;

    init() {
        self.data = Holder{ sub: null };
    }
}
